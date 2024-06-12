import 'package:bagan/constant/images.dart';
import 'package:bagan/screens/pagoda_history/history_of_pagodas_details_screen.dart';
import 'package:bagan/utils/screen_route_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../../generated/locale_keys.g.dart';
import '../../provider/home_screen_provider.dart';
class PagodaMenu{
  final String pagodaName;
  final String pagodaImage;
  final String pagodaDescription;
  PagodaMenu(this.pagodaDescription, {required this.pagodaName,required this.pagodaImage});

}
class HistoryOfPagodasScreen extends StatefulWidget {
  const HistoryOfPagodasScreen({super.key});

  @override
  State<HistoryOfPagodasScreen> createState() => _HistoryOfPagodasScreenState();
}

class _HistoryOfPagodasScreenState extends State<HistoryOfPagodasScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.init(context);
    List<PagodaMenu>  pagodaList = [
      PagodaMenu(pagodaName:LocaleKeys.kantotpalin.tr(),pagodaImage: kantotpalinImg,LocaleKeys.gawdawpalinHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.konetawgyi.tr(),pagodaImage: konetawgyiImg ,LocaleKeys.konetawgyiHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.kyansitthaumin.tr(),pagodaImage: kyansittharuminImg ,LocaleKeys.kyansitthaUminHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.kyaukguupagoda.tr(),pagodaImage:  kyaukguImg,LocaleKeys.kyaukguupagodaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.guupyaukbocho.tr(),pagodaImage: bochomiImg ,LocaleKeys.gubyaukbochomiHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.guubyaukgyimyinkaba.tr(),pagodaImage: gupyaukgyimyinkabaImg,LocaleKeys.gubyaukgyimyinkabaHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.guubyaukgyipig.tr(),pagodaImage: gupyaukgyipigImg ,LocaleKeys.gubyaukgyipigHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.guupyauknge.tr(),pagodaImage: gubyaukngeImg ,LocaleKeys.gubyaukngemyinkabaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.guupyaukngepig.tr(),pagodaImage:  gubyaukngepigImg,LocaleKeys.gubyaukngepigHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.ngakywenadaung.tr(),pagodaImage:ngakyweImg ,LocaleKeys.ngakywenadaungHistory.tr()  ),

      PagodaMenu(pagodaName:LocaleKeys.ngatpyitaung.tr(),pagodaImage: ngatpyittaungImg ,LocaleKeys.ngatpyittaungHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.seinnyetnyima.tr(),pagodaImage: seinnyatnyimaImg ,LocaleKeys.seinyatnyimaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.seinnyetama.tr(),pagodaImage: seinnyetamaImg ,LocaleKeys.seinyatamaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.soemingyi.tr(),pagodaImage:  soemingyikyaungImg,LocaleKeys.soemingyikyaungHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.soemingyipagoda.tr(),pagodaImage: soemingyipagodaImg ,LocaleKeys.soemingyipagodaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.sularmani.tr(),pagodaImage: sulamaniImg ,LocaleKeys.sulamaniHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.saytanargyi.tr(),pagodaImage: saydanargyiImg ,LocaleKeys.saydanargyiHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.hsinmyarshin.tr(),pagodaImage: sinmyarshinImg ,LocaleKeys.sinmyarshinHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.sabadar.tr(),pagodaImage:  sabadaImg,LocaleKeys.sabadaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.tantkyitaung.tr(),pagodaImage:tantkyitaungImg  ,LocaleKeys.tantkyitaungHistory.tr() ),

      PagodaMenu(pagodaName:LocaleKeys.tayokepyay.tr(),pagodaImage: tayokepyayImg ,LocaleKeys.tayokepyayHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.taichut.tr(),pagodaImage: taichutguImg ,LocaleKeys.taichutguHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.tuyintaung.tr(),pagodaImage: tuyintaungImg,LocaleKeys.tuyitaungHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.taungponelawkanarhta.tr(),pagodaImage:  taungponlawkaImg,LocaleKeys.taungponlawkanarhtaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.hteetasaung.tr(),pagodaImage: hteetasaungImg,LocaleKeys.hteetasaungHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.htilominlo.tr(),pagodaImage: htilominloImg,LocaleKeys.hteelominloHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.dhammayarzika.tr(),pagodaImage: dhamayazikaImg ,LocaleKeys.dhamarazikaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.dhammayangyi.tr(),pagodaImage: dhamayangyiImg ,LocaleKeys.dhammayangyiHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.nagayonguu.tr(),pagodaImage:  nagayonhpayaImg,LocaleKeys.nagayoneHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.nathlaungkyaung.tr(),pagodaImage:nathlaungImg ,LocaleKeys.nathlaungkyaungHistory.tr()  ),

      PagodaMenu(pagodaName:LocaleKeys.nandamannya.tr(),pagodaImage: nandamanyaImg ,LocaleKeys.nandarmanyaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.nantemple.tr(),pagodaImage: nampayaImg ,LocaleKeys.nanpayaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.pahtothamya.tr(),pagodaImage: pahtotharmyarImg ,LocaleKeys.pahtotharmyarHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.pawttawmu.tr(),pagodaImage:  pawdawmuImg,LocaleKeys.pawdawmuHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.pyathadar.tr(),pagodaImage: pyathadagyiImg,LocaleKeys.pyathadargyiHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.phetlaik.tr(),pagodaImage: petleikImg ,LocaleKeys.petleikHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.buuphayapagoda.tr(),pagodaImage: bupayaImg,LocaleKeys.bupayaHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.phayathonzu.tr(),pagodaImage: payathonzuImg,LocaleKeys.payathonzuHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.mingalazedi.tr(),pagodaImage:  mingalazediImg,LocaleKeys.mingalarzediHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.manuha.tr(),pagodaImage:manuhaImg ,LocaleKeys.manuharHistory.tr()  ),

      PagodaMenu(pagodaName:LocaleKeys.malapyit.tr(),pagodaImage: malarpyitImg ,LocaleKeys.malarpyitHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.malonpyit.tr(),pagodaImage: malonepyitImg,LocaleKeys.malonepyitHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.maharbawdi.tr(),pagodaImage: maharbawdiImg ,LocaleKeys.maharbawdiHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.meemalaung.tr(),pagodaImage:  meemalaungImg,LocaleKeys.meemalaungHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.myinkaba.tr(),pagodaImage: myinkabarImg ,LocaleKeys.myinkabaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.myinpyaguu.tr(),pagodaImage: myinpyaguImg ,LocaleKeys.myinpyaguHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.myazedi.tr(),pagodaImage: myazediImg ,LocaleKeys.myazediHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.myayponthaphayahla.tr(),pagodaImage: myaypontharpayahlaImg,LocaleKeys.myaypontharhlaHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.yatsautguu.tr(),pagodaImage:  yasautguImg,LocaleKeys.yatsautguHisttory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.shwegugyi.tr(),pagodaImage:shwegugyiImg ,LocaleKeys.shwegugyiHistory.tr()  ),

      PagodaMenu(pagodaName:LocaleKeys.shwezigon.tr(),pagodaImage: shwezigonImg ,LocaleKeys.shwezigonHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.shwesandaw.tr(),pagodaImage: shwesandaawImg ,LocaleKeys.shwesandawHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.shinpinthetshay.tr(),pagodaImage: shinpinthetshayImg,LocaleKeys.shinpinthetshayHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.shinpintherhlaung.tr(),pagodaImage:  shinpintharhlaungImg,LocaleKeys.shinpintharhlaungHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.shinarnanda.tr(),pagodaImage: arnandaroatkyaungImg,LocaleKeys.shinarnandarHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.latputkan.tr(),pagodaImage: letputkanguImg,LocaleKeys.latputkanguHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.lawkahtaikpan.tr(),pagodaImage: lawkahteikpanImg ,LocaleKeys.lawkahtaikpanHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.lawkananda.tr(),pagodaImage: lawkanandaImg ,LocaleKeys.lawkanandarHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.laymyathnar.tr(),pagodaImage:  laymyatnarImg,LocaleKeys.laymyatnarHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.thettawyazedi.tr(),pagodaImage:thetawyaImg ,LocaleKeys.thetawyaHistory.tr()  ),

      PagodaMenu(pagodaName:LocaleKeys.thetkyamuni.tr(),pagodaImage: sakkyaImg,LocaleKeys.sakkyamuniHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.thinganyone.tr(),pagodaImage: thinganyoneImg,LocaleKeys.thinganyoneHistory.tr()  ),
      PagodaMenu(pagodaName:LocaleKeys.thetbinnyu.tr(),pagodaImage: thatbyinnyuImg ,LocaleKeys.thatbyinyuHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.thanbula.tr(),pagodaImage:  thanbulaImg,LocaleKeys.thambulaHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.thahtaymokguu.tr(),pagodaImage: thahtaymoteImg ,LocaleKeys.thahtaymoteHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.thantawkyar.tr(),pagodaImage: thantawkyarImg ,LocaleKeys.thantawkyarHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.abeyadana.tr(),pagodaImage: abeyadanaImg ,LocaleKeys.abeyadanarHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.alotawpyae.tr(),pagodaImage: alotawpyiImg ,LocaleKeys.alotawpyiHistory.tr() ),
      PagodaMenu(pagodaName:LocaleKeys.arnandar.tr(),pagodaImage:  arnandarImg,LocaleKeys.arnandarHistory.tr() ),
    ];




    return Scaffold(
       //backgroundColor:primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*150,
            child: ListView.builder(

              itemCount: pagodaList.length,
              itemBuilder: (context,index)=>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        context.navigateAndRemoveUntil(PagodasHistoryDetailsScreen(pagodaName: pagodaList[index].pagodaName, pagodaImage: pagodaList[index].pagodaImage, pagodaDescription: pagodaList[index].pagodaDescription), true);
                      },
                      child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height*0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)
                                            ),
                                        image:  DecorationImage(
                                            image: AssetImage(pagodaList[index].pagodaImage),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(pagodaList[index].pagodaName,style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor
                                    ),),
                                  )
                                ]
                            ),
                          )
                      ),
                    ),
                  ),
            ),
          ),
        ));
  }
}
