class CardViewModel {
  final String backgroundAssetPath;
  final String caption;

  CardViewModel({
    this.backgroundAssetPath,
    this.caption
  });
}


final List<CardViewModel> demoCards = [

  new CardViewModel(
     backgroundAssetPath: 'assets/pic1.jpg',
     caption: 'Something about image 1'
  ),
  new CardViewModel(
      backgroundAssetPath: 'assets/pic2.jpg',
      caption: 'Something about image 2'
  ),
  new CardViewModel(
      backgroundAssetPath: 'assets/pic3.jpg',
      caption: 'Something about image 3'
  ),
  new CardViewModel(
      backgroundAssetPath: 'assets/pic4.jpg',
      caption: 'Something about image 4'
  ),
  new CardViewModel(
      backgroundAssetPath: 'assets/pic5.jpg',
      caption: 'Something about image 5'
  ),
  new CardViewModel(
      backgroundAssetPath: 'assets/pic6.jpg',
      caption: 'Something about image 6'
  ),
  new CardViewModel(
      backgroundAssetPath: 'assets/pic7.jpg',
      caption: 'Something about image 7'
  )
];