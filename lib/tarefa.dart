class Tarefa{
  String nome;
  bool concluida;
  DateTime date = DateTime.now();
  
   
  String datenow(){
    return "${date.day}-${date.month}-${date.year} ${date.hour}:${date.minute}:${date.second}";

  }
  Tarefa(this.nome){
    
    concluida = false;
  }

}