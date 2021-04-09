enum TARGET {PROD,DEV}
class Urls{
    static String getBaseUrl(TARGET target){
      var baseUrl = _url(target);
      return baseUrl;
    }
    
    static String _url(TARGET target){
      switch(target){
        case TARGET.PROD:
          return 'https://jsonplaceholder.typicode.com';
          break;
        case TARGET.DEV:
          return ''; // servidor local
          break;
        default:
          return '';
      }
      
    }
}

