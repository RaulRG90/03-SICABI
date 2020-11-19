'use strict';

var graph_bar={
    render:function(id,data,background){
        
        let canvas=$('<canvas>',{'id':id});
        let labels=this.get_labels(data);
        let datasets=this.get_datasets(data,background);
        let graphBar=new Chart(canvas,{
            type:'bar',
            data:{
                labels:labels,
                datasets:datasets
            },
            options:{
                responsive:true,
                maintainAspectRatio:false,
                scales:{
                    yAxes:[{
                        ticks:{
                            beginAtZero:true
                        }
                    }],
                    xAxes:[{
                        type:'time',
                        distribution:'series',
                        offset:'true',
                        time:{
                            unit:'day'
                        },
                        gridLines:{
                            offsetGridLines: true
                        }
                    }]
                }
            }
        });
        
        return canvas;
    },
    get_labels:function(data){
        
        return Object.keys(data);
    },
    get_datasets:function(datos,backgroud){
        
        let dataset=[];
        let objetos=Object.keys(datos);
        
        objetos.forEach(function(objeto){
            
            dataset.push({
                'label':objeto,
                'data':datos[objeto],
                'backgroundColor':backgroud[objeto],
                'borderWidth':1
            });
        });
        
        return dataset;
    }
};

