class HexColors {

  hexColor(String colorhexcode){
      String colornew = '0xff' + colorhexcode;

      colornew = colornew.replaceAll("#", "");
      int colorInt = int.parse(colornew);

      return colorInt;
  }


}