import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/allHotelProvider.dart';
import 'package:hotel/controller/FavouriteAPIs.dart';
import 'package:provider/provider.dart';
import '../../Icons/my_hoteli_icons.dart';
import '../../Providers/BottombarProvider.dart';
import '../../controller/GetHotel.dart';
import 'MainHomeScreen.dart';



class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if(Provider.of<BBProvider>(context , listen: false).currentIndex==1){
            Provider.of<BBProvider>(context , listen: false).setcurrentindex(0);
          }else
          {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
          }
          return Future(() => false);
        },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(right: 20),
          child: Consumer<allHotelProvider>(
  builder: (context, provider, child) {
  return provider.data?[0].isFav == false && provider.data?[1].isFav == false && provider.data?[2].isFav == false ?
Center(child: Text("No Favorite Hotels")):  ListView.builder(itemBuilder: (context, index) {
    return provider.data?[index].isFav == true ? Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: ()async{
            await GetHotel(context).getHotel((provider.data?[index].userId).toString(),"Hotel${index}",index,int.parse((provider.data?[index].rate).toString()),provider.data?[index].userId == 3 ? true : false);
          },
          child: Container(
            margin: EdgeInsets.only(left: 20,top: 20 , bottom: 10 ),
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 0,
                      offset: Offset(0, 4)
                      ,blurRadius: 6
                  )
                ]
            ),

            child: Column(

              children: [
                Hero(
                  tag:"Hotel${index}",
                  child: Container(
                    width:  MediaQuery.of(context).size.width,
                    height: 209,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: provider.data?[index].imageId == 2
                                ? AssetImage("images/2.jpeg") :
                            provider.data?[index].imageId == 3 ?
                            AssetImage("images/alreem.jpg") :
                            AssetImage("images/3hotel.jpg")

                        )
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0 , right: 8.0 , top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text("${provider.data?[index].name}", style: TextStyle(fontWeight: FontWeight.bold))),
                            Icon(Icons.star , color: Color(0xffFFD33C),) ,
                            Text(provider.data?[index].rate != null ?"${provider.data?[index].rate}.0" : "0.0", style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ) ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${provider.data?[index].location?.country}"" - ${provider.data?[index].location?.city}" , style: TextStyle(color: Color(0xff878787), fontWeight: FontWeight.bold),)
                          ],
                        ) ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("SP".tr+ "${provider.data?[index].minPrice}" , style: TextStyle(color: Color(0xff4C4DDC) , fontWeight: FontWeight.bold),),
                                Text("/night".tr , style: TextStyle(color: Color(0xff878787), fontWeight: FontWeight.bold),)
                              ],
                            ),
                            provider.data![index].isOffer == true ? Icon(Icons.sell ,color: Colors.red,) : Text("")
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0 , right: 5.0),
          child: Hero(
            tag:"Fev${index}",
            child: IconButton(
              onPressed: () async {
                await FavouriteAPIs(context).DeleteFavourite(index);
              },
              style: ButtonStyle(
                  iconSize: MaterialStatePropertyAll(20),
                  minimumSize: MaterialStatePropertyAll(Size(40, 40)),
                  maximumSize:  MaterialStatePropertyAll(Size(40, 40)),
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  iconColor: MaterialStatePropertyAll(Color(0xff4C4DDC)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffEDEDED), width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(40))))),
              icon: Icon(
                MyHoteli.love,
              ),
            ),
          ),
        ),
      ],
    ):Text("");
  },
    itemCount: provider.data?.length,
  );
  },
),
        )
      ),
    );
  }
}
