import 'package:flutter/material.dart';

class CustomSizeColor extends StatelessWidget {
  const CustomSizeColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           Container(
                    //  color: const Color.fromARGB(255, 45, 39, 20),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                MethodeSize(size: "S",),
                MethodeSize(size: "M",),
                MethodeSize(size: "L",),
                MethodeSize(size: "XL",),
                
                ],
              ),),
          const    SizedBox(height: 20,),
                    Container(
                              //  color: Colors.amber,
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   MethodeColor(color: Color(0xFF99A7A7),),
                   MethodeColor(color: Colors.grey,),
                   MethodeColor(color: Colors.black,)
                       
                        
              ],
            ),
          )
      ],
    );
  }
}

class MethodeColor extends StatelessWidget {
  final Color color ;
  const MethodeColor({
    super.key, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: CircleAvatar(child: Container(height: 10,width: 30,decoration: BoxDecoration(
       color: color ,
       borderRadius: BorderRadius.circular(50)
      ),), backgroundColor: Colors.white,),
    );
  }
}

class MethodeSize extends StatelessWidget {
  final String size ;
  const MethodeSize({
    super.key, required this.size,
  });

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: CircleAvatar(child: Text( size,), backgroundColor: Colors.white,));
  }
}