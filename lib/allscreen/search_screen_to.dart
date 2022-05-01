import 'package:cab_app/allscreen/mapscreen.dart';
import 'package:flutter/material.dart';
// import 'package:users_app/assistants/request_assistant.dart';
// import 'package:users_app/global/map_key.dart';
// import 'package:users_app/models/predicted_places.dart';
// import 'package:users_app/widgets/place_prediction_tile.dart';


class SearchPlacesScreenTo extends StatefulWidget
{

  @override
  _SearchPlacesScreenToState createState() => _SearchPlacesScreenToState();
}




class _SearchPlacesScreenToState extends State<SearchPlacesScreenTo>
{
  // List<PredictedPlaces> placesPredictedList = [];

  // void findPlaceAutoCompleteSearch(String inputText) async
  // {
  //   if(inputText.length > 1) //2 or more than 2 input characters
  //       {
  //     String urlAutoCompleteSearch = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$inputText&key=$mapKey&components=country:PK";
  //
  //     var responseAutoCompleteSearch = await RequestAssistant.receiveRequest(urlAutoCompleteSearch);
  //
  //     if(responseAutoCompleteSearch == "Error Occurred, Failed. No Response.")
  //     {
  //       return;
  //     }
  //
  //     if(responseAutoCompleteSearch["status"] == "OK")
  //     {
  //       var placePredictions = responseAutoCompleteSearch["predictions"];
  //
  //       var placePredictionsList = (placePredictions as List).map((jsonData) => PredictedPlaces.fromJson(jsonData)).toList();
  //
  //       setState(() {
  //         placesPredictedList = placePredictionsList;
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //search place ui
            Container(
              height: 160,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
                boxShadow:
                [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 8,
                    spreadRadius: 0.5,
                    offset: Offset(
                      0.7,
                      0.7,
                    ),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [

                    const SizedBox(height: 25.0),

                    Stack(
                      children: [

                        GestureDetector(
                          onTap: ()
                          {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),

                        const Center(
                          child: Text(
                            "Search & Set Location",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16.0),

                    Row(
                      children: [

                        const Icon(
                          Icons.adjust_sharp,
                          color: Colors.white70,
                        ),

                        const SizedBox(width: 18.0,),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (valueTyped)
                              {
                                // findPlaceAutoCompleteSearch(valueTyped);
                              },
                              decoration: const InputDecoration(
                                hintText: "search here...Where to go?",
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: 11.0,
                                  top: 8.0,
                                  bottom: 8.0,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),

            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (c)=> MyHomePage()),),

          },

        )
    );

  }


//           //display place predictions result
//           // (placesPredictedList.length > 0)
//                Expanded(
//             child: ListView.separated(
//               // itemCount: placesPredictedList.length,
//               physics: ClampingScrollPhysics(),
//               itemBuilder: (context, index)
//               // {
//               //   // return PlacePredictionTileDesign(
//               //   //   predictedPlaces: placesPredictedList[index],
//               //   );
//               // },
//               separatorBuilder: (BuildContext context, int index)
//               {
//                 return const Divider(
//                   height: 1,
//                   color: Colors.white,
//                   thickness: 1,
//                 );
//               },
//             ),
//           )
//               : Container(),
//         ],
//       ),
//     );
//   }
}
