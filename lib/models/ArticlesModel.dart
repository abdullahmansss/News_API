class ArticlesModel
{
  Map dataFromApi;

  ArticlesModel(this.dataFromApi);

  String getStatus () => dataFromApi['status'];
  int getResults () => dataFromApi['totalResults'];
  List getArticles () => dataFromApi['articles'] as List;
}

class ArticleDetailsModel
{
  Map article;

  ArticleDetailsModel(this.article);

  String getImage () => article['urlToImage'];
  String getTitle () => article['title'];
  String getSource () => article['source']['name'];
  String getDate () => article['publishedAt'];
}