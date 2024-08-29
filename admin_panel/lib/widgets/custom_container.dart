import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final String? fullName;
  final IconButton? icon;
  final bool? showIcon;
  const CustomContainer({super.key, this.fullName, this.icon,  this.showIcon = true});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  Future<void>  _showDialog() async{
    return showDialog(context: context, barrierDismissible:false, builder: (BuildContext context){
      return  AlertDialog(
        title: const Text("Are you sure you want to delete this user?", style: TextStyle(fontSize: 18),),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('Cancel')),
          const SizedBox(width: 90),
          TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Yes'))
        ],
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.person, size: 25,),
          const SizedBox(width: 10),
          Expanded(
            child: Text('${widget.fullName}', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          ),
          if(widget.showIcon ?? false)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.update, size: 20), style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
            ), 
          ),
          if(widget.showIcon ?? false)
          IconButton(onPressed: () {setState(() {_showDialog();
          });}, icon: const Icon(Icons.delete, size: 20),  style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
            ), )
        ],
      ),
    );
  }
}
