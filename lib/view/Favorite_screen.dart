import 'package:ecommerce/Provider/favoriteProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
   final finalList = provider.favorites;
    return  Scaffold(
  body: Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20,left: 20),
        child: Row(
          children: [
            Text("Favorites",style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
      Expanded(child: ListView.builder(
        itemCount: finalList.length,
          itemBuilder: (context,index){
            return Padding(
                padding: EdgeInsets.all(8.0),

            child: Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                      onPressed: (context){
                     setState(() {
                       finalList.removeAt(index);
                     });
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    icon: Icons.delete,
                  label: "Delete",)
                ],
              ),
              child: ListTile(
                title: Text(
                  finalList[index].name.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),

                ),
                subtitle: Text(
                  finalList[index].description.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(finalList[index].image!),
                  backgroundColor: Colors.red.shade100,
                ),
                trailing: Text(
                  '\$${finalList[index].price}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                tileColor: Colors.white,
              ),
            ),
            );
          }))
    ],
  ),
    );
  }
}
