import 'package:flutter/material.dart';
import 'package:project_akbar_database/halaman_detail.dart';
import 'package:project_akbar_database/matches_model.dart';
import 'data_source.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Piala Dunia 2022")
      ),
       body: Container(
          padding: EdgeInsets.all(8),
          child: FutureBuilder(
            future: 
            ListMatchesSource.instance.loadMatches(),

            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                // debugPrint(snapshot.data);
                return _buildErrorSection();
              }
              if (snapshot.hasData) {
                return _buildSuccessSection(snapshot.data);
              }
              return _buildLoadingSection();
            },
          ),
        ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildSuccessSection(List<dynamic> data) {
    return ListView.builder(
        itemCount: 48,
        itemBuilder: (BuildContext context, int index) {
          MatchesModel matchesModel = MatchesModel.fromJson(data[index]);
          return Container(
            width: double.infinity,
            height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: ((context) {
                    
                    return DetailPage(id: matchesModel.id.toString(),);
                    })
                  )),
                  child: Card(
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                          // width: 470,
                          // height: 150,
                          child: Row (
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network("https://countryflagsapi.com/png/${matchesModel.homeTeam?.name}", width: 190, height: 150,),
                              SizedBox(width: 10,),
                              Text("${matchesModel.homeTeam?.goals}"),
                              SizedBox(width: 10,),
                              Text(" - "),
                              SizedBox(width: 10,),
                              Text("${matchesModel.awayTeam?.goals}"),
                              SizedBox(width: 10,),
                              Image.network("https://countryflagsapi.com/png/${matchesModel.awayTeam?.name}", width: 190, height: 150,),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("${matchesModel.homeTeam?.name}                                                           ${matchesModel.awayTeam?.name}"),
                      ],
                    ),

                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}