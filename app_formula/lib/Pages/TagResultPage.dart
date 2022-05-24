import 'package:flutter/material.dart';
import 'package:recipes/Model/Recipe.dart';
import 'package:recipes/Pages/RecipePage.dart';
import 'package:recipes/Pages/Main_screen.dart';
import 'package:recipes/Pages/TagsPage.dart';

class TagResultPage extends StatefulWidget {
  final List<Recipe> favoriteList;
  final String tagName;
  TagResultPage({Key? key, required this.favoriteList, required this.tagName}) : super(key: key);

  @override
  TagResultPageState createState() => TagResultPageState(this.favoriteList, this.tagName);
}

class TagResultPageState extends State<TagResultPage> {

  TagResultPageState(this.favoriteList, this.tagName);

  final tagName;
  final favoriteList;
  final RecipeData recipeData = RecipeData();
  List<Recipe> favoriteRecipes = [];
  List<Recipe> tagRecipesList = [];

  @override
  void initState() {
    super.initState();
    favoriteRecipes = favoriteList;
    getTagsList();
  }


  void getTagsList()
  {
    for(int i = 0; i < recipeData.allRecipesDataList.length; i++)
      {
        for(int j = 0; j < recipeData.allRecipesDataList[i].tegs.length; j++)
          {
            if(tagName == recipeData.allRecipesDataList[i].tegs[j])
              {
                tagRecipesList.add(recipeData.allRecipesDataList[i]);
              }
          }
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Книга рецептів'),
        centerTitle: true,
      ),
      body:
      ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index){
            return Center(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10),),
                        Text('Тег: ' + tagName),
                        Text('Рецепти, які відносяться до даного тегу:'),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: tagRecipesList.length,
                            itemBuilder: (BuildContext context, int i){
                              return Center(
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    child: Column(
                                        children: <Widget>[
                                          const Padding(padding: EdgeInsets.only(top: 10),),
                                          Column(
                                              children: [
                                                Text(tagRecipesList[i].recipeName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                                              ]
                                          ),
                                          const Padding(padding: EdgeInsets.only(top: 10),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Категорія: ', style: TextStyle(fontWeight: FontWeight.bold,),),
                                                Flexible(
                                                  child: Text(tagRecipesList[i].categoryName,),
                                                ),
                                              ]
                                          ),
                                          const Padding(padding: EdgeInsets.only(top: 10),),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext context) =>
                                                            RecipePage(
                                                              element: tagRecipesList[i],
                                                              favoriteList: favoriteRecipes,
                                                            )
                                                    )
                                                );
                                              },
                                              child: const Text('Перейти до рецепту')),
                                          const Padding(padding: EdgeInsets.only(top: 10),),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext context) =>
                                                            MainScreen(favoriteList: favoriteRecipes,)
                                                    )
                                                );
                                              },
                                              child: const Text('Повернутися до списку категорій')),
                                          const Padding(padding: EdgeInsets.only(top: 10),),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext context) =>
                                                            TagsPage(
                                                              favoriteList: favoriteRecipes,
                                                            )
                                                    )
                                                );
                                              },
                                              child: const Text('Повернутися до списку тегів')),
                                          const Padding(padding: EdgeInsets.only(top: 50),),
                                        ]
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ]
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
