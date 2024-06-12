import 'package:bagan/constant/images.dart';
import 'package:bagan/screens/prominent_people/kings_of_bagan_details.dart';
import 'package:bagan/utils/screen_route_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../../generated/locale_keys.g.dart';
import '../../provider/home_screen_provider.dart';
class KingsList{
   String kingName;
   String kingImage;
   String kingDescription;
  KingsList( this.kingName,this.kingImage, this.kingDescription);
}
class KingsOfBaganScreen extends StatefulWidget {
  const KingsOfBaganScreen({super.key});

  @override
  State<KingsOfBaganScreen> createState() => _KingsOfBaganScreenState();
}

class _KingsOfBaganScreenState extends State<KingsOfBaganScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.init(context);
    List<KingsList>  prominentList = [
      KingsList(LocaleKeys.anawrahta.tr(),anawrahtaKingImg, LocaleKeys.anawrahtaNote.tr()),
      KingsList(LocaleKeys.sawlu.tr(),sawluImg,LocaleKeys.sawluNote.tr()),
      KingsList(LocaleKeys.kyansittha.tr(),kyansitthaImg,LocaleKeys.kyansitNote.tr()),
      KingsList(LocaleKeys.alaungsithu.tr(),alaungsithuImg,LocaleKeys.alaungSithuNote.tr()),
      KingsList(LocaleKeys.naratheinkha.tr(),naratheinkhaImg,LocaleKeys.naratheinkhaNote.tr()),
      KingsList(LocaleKeys.narapatisithu.tr(),narapatisithuImg,LocaleKeys.narapatisithuNote.tr()),
      KingsList(LocaleKeys.htilominloking.tr(),htilominloKingImg,LocaleKeys.htilominloNote.tr()),
      KingsList(LocaleKeys.kyaswar.tr(),kyaswarImg,LocaleKeys.kyaswarNote.tr()),
      KingsList(LocaleKeys.uzana.tr(),uzanaImg,LocaleKeys.uzanaNote.tr()),
      KingsList(LocaleKeys.narathihapati.tr(),narathihapatiImg,LocaleKeys.narathihapateNote.tr()),
      KingsList(LocaleKeys.kyawswa.tr(),kyawswarImg,LocaleKeys.kyawswarNote.tr()),
      KingsList(LocaleKeys.sawhnit.tr(),anawrahtaKingImg,LocaleKeys.sawhnitNote.tr()),
      KingsList(LocaleKeys.sawmonhnit.tr(),anawrahtaKingImg,LocaleKeys.sawmonhnitNote.tr()),
      KingsList(LocaleKeys.ngahtweyu.tr(),ngahtweyuImg,LocaleKeys.ngahtweyuNote.tr()),
      KingsList(LocaleKeys.ngalonletpe.tr(),ngaloneletpeImg,LocaleKeys.ngaloneletpeNote.tr()),
      KingsList(LocaleKeys.nyaunguphi.tr(),nyaunguphiImg,LocaleKeys.nyaungupeNote.tr()),
      KingsList(LocaleKeys.yamankan.tr(),yamankanImg,LocaleKeys.yamankanNote.tr()),



    ];
    return Scaffold(
        //backgroundColor:Colors.white.withOpacity(0.9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*150,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing:10 ,
              childAspectRatio: 0.7,
            ),
            itemCount: prominentList.length,
            itemBuilder: (context,index)=>
           GestureDetector(
             onTap: (){
               context.navigateAndRemoveUntil(KingsOfBaganDetailsScreen(kingName: prominentList[index].kingName, kingDescription: prominentList[index].kingDescription),true);
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
                     Expanded(
                       flex: 4,
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           image:  DecorationImage(
                             image: AssetImage(prominentList[index].kingImage),
                             fit: BoxFit.cover
                           )
                         ),
                       ),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(prominentList[index].kingName,style: const TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.bold,
                           color: primaryColor,
                           fontFamily: 'Poppins'
                         ),),
                       ),
                     )
                   ]
               ),
             )
                       ),
           ),
        ),
      ),
      ));
  }
}
