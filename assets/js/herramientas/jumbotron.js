var jumbotron={
    render:function(titulo){
        
        let jumbotron=$('<div>',{'class':'jumbotron'});
        let encabezado=$('<h1>',{'class':'display-4 text-center'});
        
        $(encabezado).text(titulo);
        $(jumbotron).append(encabezado);
        
        return jumbotron;
    }
};