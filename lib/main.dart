import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'dart:js' as js;
import 'package:responsive_grid/responsive_grid.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.red
        ),
        useMaterial3: false,
        buttonTheme:const ButtonThemeData(
          buttonColor: Colors.red
        ),
        
      ),
      home: const WebViewPage(),
    );
  }
}

class WebViewPage extends StatelessWidget {
  static const platform = MethodChannel('com.example.webview');

  const WebViewPage({super.key});

 openWebView({String? url}) async {
    try {
      if(GetPlatform.isWeb){
    //  js.context.callMethod('open', [url]);
      }else{
       await platform.invokeMethod('openWebView',GetPlatform.isIOS?{'url':url}: url);
    }} on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to open web view: '${e.message}'.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    List apps=[
      {
        "image":"https://th.bing.com/th/id/OIP.hQ2zPS6VNQFnizu6LSU1ngAAAA?rs=1&pid=ImgDetMain",
        "appName":"Instagram",
        "link":"https://www.instagram.com/",
        "height":100.0,
        "width":100.0,
        "padding":10.0,
      },
      {
        "image":"https://th.bing.com/th/id/OIP.-ZDxktb8ikNbPBhJEC1izAHaHZ?rs=1&pid=ImgDetMain",
        "appName":"Whatsapp",
        "link":"https://web.whatsapp.com/",
        "height":70.0,
        "width":70.0,
        "padding":35.0,
      },
      {
        "image":"https://th.bing.com/th/id/OIP.Y6P1GkxkEoLoIRsS1wMZiwHaFj?rs=1&pid=ImgDetMain",
        "appName":"YouTube",
        "link":"https://youtube.com/",
        "height":160.0,
        "width":160.0,
        "padding":10.0,
      },
      {
        "image":"https://static.vecteezy.com/system/resources/previews/027/395/710/non_2x/twitter-brand-new-logo-3-d-with-new-x-shaped-graphic-of-the-world-s-most-popular-social-media-free-png.png",
        "appName":"Twitter",
        "link":"https://x.com/home",
        "height":60.0,
        "width":60.0,
        "padding":10.0,
      },
      {
        "image":"https://th.bing.com/th/id/OIP.ENIq-U2iyx2c51zh5Hv5aAAAAA?rs=1&pid=ImgDetMain",
        "appName":"Facebook",
        "link":"https://www.facebook.com/",
         "height":100.0,
        "width":100.0,
        "padding":10.0,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title:const Text('InAppWebView'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: controller,

                decoration: InputDecoration(
                 
                  hintText: "ex: youtube.com",
                  suffix: IconButton(onPressed: (){
                    controller.clear();
                  }, icon:const Icon(Icons.clear))
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateColor.resolveWith((states) => Colors.red)
              ),
              onPressed: (){
                if(controller.text.trim().toString()!=""){
              openWebView(url: "https://${controller.text.toString()}");}
            }, label:const Text("Search"),icon:const Icon(Icons.search,size: 16,),),
            ResponsiveGridRow(
              
              children: [
              ...List.generate(apps.length, (index) => 
              ResponsiveGridCol(
                xl: 2,
                lg: 2,
                md: 3,
                xs: 6,
                sm: 6,
                child: SizedBox(
                height: 180,
                child: InkWell(
                  onTap: (){
                    openWebView(url: apps[index]["link"]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(imageUrl: apps[index]["image"],height: apps[index]["height"],width: apps[index]["width"],),
                        
                      ],
                    ),
                  ),
                ),
              )))
            ])
          ],
        ),
      )
    );
  }
}
