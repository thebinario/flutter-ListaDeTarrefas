import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/tarefa.dart';

void main() {
  runApp(new TodoListApp());
}

class TodoListApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TodoList App',
      home: new ListaScreen(),
    );
  }
  }

  class ListaScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new ListaScreenState();
}
  
// ignore: must_be_immutable
class ListaScreenState extends State<ListaScreen>{

  List<Tarefa> tarefas = new List<Tarefa>();
  TextEditingController controller= new TextEditingController();

  void adicionarTarefas(String nome){
    setState(() {
      tarefas.add(Tarefa(nome));
    });
    controller.clear();
    
  }

  Widget getItem(Tarefa tarefa){
    
    
    
      
      return  Row(
              children: [
                IconButton(
                  icon: new Icon(tarefa.concluida ? Icons.check_box : Icons.check_box_outline_blank, color: Colors.green,),
                  iconSize: 42,
                  onPressed: (){

                    setState(() {
                      if(tarefa.concluida == false){
                        tarefa.concluida = true;
                      }else{
                       tarefa.concluida = false;
                      }
                      
                    });
                  },
      
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(tarefa.nome),
                      Text(tarefa.datenow()),
                      
                     
                      
                     
                    ]
                  ),

              ],);
          
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Tarefas'),
          backgroundColor: Colors.deepPurple[900],
          
          
        ),
      
        body: Column(
         
          children:<Widget> [
            Container(
              padding: EdgeInsets.all(16.0),
              
              child: TextField(
              

                controller: controller,
                onSubmitted: (value){
                  adicionarTarefas(value);
                },
              ),
            ), 
            Expanded(
              
              child: ListView.builder(
                
                itemCount: tarefas.length,
                itemBuilder: (_, indice){
                  return getItem(tarefas[indice]);
                },

              )
            ),
            
            
          ],),
      );
    // ignore: dead_code
    
  }
  
}