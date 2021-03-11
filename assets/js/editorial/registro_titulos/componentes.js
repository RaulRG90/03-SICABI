'use strict';

/* ******************* *
* ***** Cabecera ***** *
* ******************** */
let cabecera={
    crear_btn_group:function(btns){
        
        let btn_group=$('<div>',{'class':'btn-group ml-auto'});
        
        btns.forEach(btn=>{
            
            
            $(btn_group).append($(`<${btn.tipo}>`,{
                'id':btn.id,
                'type':'button',
                'class':'btn btn-secondary',
                'href':btn.href,
                'target':btn.target
            }).text(btn.valor));
        });
        
        return btn_group;
    },
    render:function(base_url,edi_id){
        
        let encabezado=$('<div>',{'class':'container-fluid border'});
        let titulo='Registro de títulos';
        let row_titulo=$('<div>',{'class':'row text-left ml-4 mt-4'});
        let row_btns_accion=$('<div>',{'class':'row text-right'});
        
        let h3=$('<h3>',{'class':'display-6'}).text(titulo);
        $(row_titulo).append(h3);
        
        $(row_btns_accion).append(this.crear_btn_group([
            {
                'id':'btn_ejemplo_etiquetas',
                'valor':'Ejemplo para etiquetas',
                'tipo':'a',
                'href':`${base_url}assets/formatos/ejemplo_etiqueta.pdf`,
                'target':'_blank'
            },
            {
                'id':'btn_titulos_registrados',
                'valor':'Titulos registrados (Excel)',
                'tipo':'a',
                'href':`${base_url}editorial/registro_titulos/titulos_registrados_excel/${edi_id}`,
                'target':'_blank'
            },
            {
                'id':'btn_lista_oficial',
                'valor':'Lista oficial Títulos Registrados',
                'tipo':'a',
                'href':`${base_url}editorial/registro_titulos/lista_oficial_titulos/${edi_id}`,
                'target':'_blank'
            }
        ]));
        
        $(encabezado).append(row_titulo).append(row_btns_accion);
        
        return encabezado;
    }
};
//--------------------------------------------------------------------------

/* ********************************* *
* ***** Boton Registrar Título ***** *
* ********************************** */
let btn_registrar_titulo={
    
    render(){
        
        let texto_btn='+ Registrar Título';
        let btn=$('<button>',{'id':'btn_registrar_titulo','type':'button','class':'btn btn-primary mt-4 mb-4'}).text(texto_btn);
        
        return btn;
    }
};
//--------------------------------------------------------------------------

/* *************************************** *
* ***** Tabla de títulos Registrados ***** *
* **************************************** */
let tabla_titulos_registrados={
    render:function(){
        
        let tabla=$('<table>',{'id':'tbl_titulos_registrados'});
        
        return tabla;
    },
    habilitar_datatable:function(nodo,api,edi_id){
        
        $(nodo).DataTable({
            'ajax':{
                'url':`${api}${edi_id}`, 
                'method':'GET',
                'cache':'false',
                'dataSrc':''
            },
            'columns':[
                {'data':'folio','title':'Folio'},
                {'data':'titulo','title':'Título'},
                {'data':'id','title':'Editar','render':data=>{
                        let btn_editar_titulo=
                                `<button 
                                    id="btn_editar_titulo_${data}" 
                                    class="btn btn-md btn-outline-info m-0 px-3 py-2 z-depth-0 waves-effect" 
                                    id_titulo="${data}">`+
                                    
                                    `<i class="fa fa-edit"></i>`+
                                `</button>`;
                        return btn_editar_titulo;
                }},
                {'data':'id','title':'Acuse','render':data=>{
                        
                        let btn_descarga_acuse=
                                `<a
                                    id="btn_descarga_acuse_${data}"
                                    class="btn btn-md btn-outline-secondary m-0 px-3 py-2 z-depth-0 waves-effect"
                                    href="${base_url}editorial/registro_titulos/acuse_titulo/${data}"
                                    target="_blank">`+
                                    
                                    `<i class="fa fa-file"></i>`+
                                `</a>`;
                        
                        return btn_descarga_acuse;
                }}
            ],
            'responsive':true,
            'dom':'f',
            'language':{
                'search':'Buscar'
            }
            });
    }
};
//--------------------------------------------------------------------------

/* ******************************************** *
* ***** Formulario de registro de titulos ***** *
* ********************************************* */
let form_registro_titulos={
    'data':'',
    'bilingue':{
        'data':[
            {'lengua':'Cochimí'},
            {'lengua':'Pa-Ipai'},
            {'lengua':'Kiliwa'},
            {'lengua':'Kumiai'},
            {'lengua':'Cucapá'},
            {'lengua':'Seri'},
            {'lengua':'Pima'},
            {'lengua':'Mayo'},
            {'lengua':'Yaqui'},
            {'lengua':'Cahita'},
            {'lengua':'Otomí'},
            {'lengua':'Kikapú'},
            {'lengua':'Tepehúan'},
            {'lengua':'Tarahumara'},
            {'lengua':'Huichol'},
            {'lengua':'Cora'},
            {'lengua':'Chichimeca-Jonaz'},
            {'lengua':'Náhuatl'},
            {'lengua':'Huasteco'},
            {'lengua':'Purépecha'},
            {'lengua':'Mixteco'},
            {'lengua':'Mazahua'},
            {'lengua':'Totonaca'},
            {'lengua':'Zapoteco'},
            {'lengua':'Mixe'},
            {'lengua':'Zoque'},
            {'lengua':'Chinanteco'},
            {'lengua':'Chontal'},
            {'lengua':'Tzotzil'},
            {'lengua':'Tzeltal'},
            {'lengua':'Chol'},
            {'lengua':'Tojolabal'},
            {'lengua':'Mame'},
            {'lengua':'Maya'},
            {'lengua':'Kekchi'},
            {'lengua':'Ixil'},
            {'lengua':'Quiché'},
            {'lengua':'Popoluca'},
            {'lengua':'Tepehua'},
            {'lengua':'Mazateco'},
            {'lengua':'Tlapaneco'},
            {'lengua':'Chontal de Tabasco'},
            {'lengua':'Chatino'},
            {'lengua':'Amuzgo'},
            {'lengua':'Trique'},
            {'lengua':'Huave'},
            {'lengua':'Guarijío'},
            {'lengua':'Tének'},
            {'lengua':'Wixárika'},
            {'lengua':'Mapuche'},
            {'lengua':'Jakalteco'}
        ]
    },
    'datos_bibliograficos':{
        'edi_id':{
            'tipo':'hidden',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Id de Editorial:'
        },
        'titulo':{
            'tipo':'text',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Título:',
            'placeholder':'Escribe el título del libro'
        },
        'titulo_original':{
            'tipo':'text',
            'atributos':null,
            'val':'',
            'etiqueta':'Título Original:',
            'placeholder':'Escribe el título en lengua original del libro'
        },
        'material':{
            'tipo':'checkbox',
            'atributos':null,
            'val':['antologia','ilustrado'],
            'etiqueta':'El material es:',
            'etiqueta_checkbox':['Antología:','Ilustrado:']
        },
        'autor':{
            'tipo':'btn_crear_seleccion',
            'atributos':{
                'required':'required',
                'multiple':'multiple'
            },
            'val':'',
            'etiqueta':'Autores:',
            'placeholder':'Escribe el título en lengua original del libro',
            'modal':'mdl_agregar_autor',
            'id':'aut_nombre',
            'textos':['aut_tipo','aut_nombre'],
            'tabla':'autores'
        },
        'indice_titulo':{
            'tipo':'textarea',
            'atributos':null,
            'val':'',
            'etiqueta':'Indice del título:'
        },
        'material_lengua_indigena':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'Material en lengua indigena:',
            'id':'lengua',
            'textos':['','lengua'],
            'tabla':'bilingue'
        },
        'sello':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Sello Editorial:',
            'id':'sel_id',
            'textos':['','sel_sello'],
            'tabla':'sellos_editoriales'
        },
        'edicion':{
            'tipo':'text',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Edición',
            'placeholder':'Escribe la edición del libro'
        },
        'anio':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Año:',
            'placeholder':'Escribe el año [xxxx] de edición del libro'
        },
        'tiraje':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Tiraje:',
            'placeholder':'Escribe el tiraje del libro'
        },
        'resenia':{
            'tipo':'textarea',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Reseña:'
        },
        'isbn':{
            'tipo':'text',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'ISBN:',
            'placeholder':'Escribe el ISBN del libro'
        },
        'paginas_con_folio':{
            'tipo':'text',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Páginas con folio:'
        },
        'pais':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'País:',
            'id':'pai_pais',
            'textos':['','pai_pais'],
            'tabla':'paises'
        },
        'ciudad':{
            'tipo':'text',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Ciudad:'
        },
        'reconocimiento_libro':{
            'tipo':'textarea',
            'atributos':null,
            'val':'',
            'etiqueta':'Reconocimiento para el libro:'
        },
        'reconocimiento_autor':{
            'tipo':'textarea',
            'atributos':null,
            'val':'',
            'etiqueta':'Reconocimiento para el autor:'
        },
        'reconocimiento_ilustrador':{
            'tipo':'textarea',
            'atributos':null,
            'val':'',
            'etiqueta':'Reconocimiento para el ilustrador:'
        },
        'nivel':{
            'tipo':'text',
            'atributos':{
                'disabled':'disabled',
                'required':'required'
            },
            'val':'1pre',
            'etiqueta':'Nivel:'
        },
        'genero':{
            'tipo':'text',
            'atributos':{
                'disabled':'disabled',
                'required':'required'
            },
            'val':'Texto literario',
            'etiqueta':'Genero:'
        },
        'categoria':{
            'tipo':'text',
            'atributos':{
                'disabled':'disabled',
                'required':'required'
            },
            'val':'El cuerpo',
            'etiqueta':'Categoría:'
        },
        'precio_publico':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'1pre',
            'etiqueta':'Precio al público:'
        },
        'disponibilidad':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'1pre',
            'etiqueta':'Disponibilidad:'
        },
        'tipo_papel':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'1pre',
            'etiqueta':'Numero de tipos de papel (interiores):',
            'id':'tipo',
            'textos':['','tipo'],
            'tabla':'tipos_papel'
        }
    },
    'datos_tecnicos':{
        'formato':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Formato (orientación):',
            'id':'formato',
            'textos':['','formato'],
            'tabla':'formatos'
        },
        'ancho':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Ancho:'
        },
        'alto':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Alto:'
        },
        'paginas_totales':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Páginas totales:'
        },
        'paginas_preliminares':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Páginas preliminares:'
        },
        'paginas_finales':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Páginas blancas finales o con promoción:'
        },
        'lomo':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Lomo:'
        }
    },
    'datos_encuadernacion_forros':{
        'forro':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Forro:',
            'id':'forro',
            'textos':['','forro'],
            'tabla':'forros'
        },
        'forro_solapa':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'El forro tiene solapa:',
            'id':'opt',
            'textos':['','opt'],
            'tabla':'opts'
        },
        'papel_forro':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Papel del forro:',
            'id':'papel',
            'textos':['','papel'],
            'tabla':'papel_forro'
        },
        'gramaje_forro':{
            'tipo':'number',
            'atributos':{
                'required':'required',
                'min':'1'
            },
            'val':'',
            'etiqueta':'Gramaje del forro:',
            'id':'gramaje',
            'textos':['','gramaje'],
            'tabla':'gramajes'
        },
        'tintas_forro':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Tintas del forro:',
            'id':'tinta',
            'textos':['','tinta'],
            'tabla':'tintas'
        },
        'acabados_forro':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Acabados del forro:',
            'id':'acabado',
            'textos':['','acabado'],
            'tabla':'acabados'
        },
        'suaje':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'El forro tiene suaje especial:',
            'id':'opt',
            'textos':['','opt'],
            'tabla':'opts'
        },
        'grabado':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'El forro tiene grabado:',
            'id':'opt',
            'textos':['','opt'],
            'tabla':'opts'
        }
    },
    'datos_guardas':{
        'foliacion':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'La foliación incluye guardas:',
            'id':'opt',
            'textos':['','opt'],
            'tabla':'opts'
        },
        'papel_guarda':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'Papel de las guardas:',
            'id':'papel',
            'textos':['','papel'],
            'tabla':'papel_forro1'
        },
        'tinta_guarda':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'Tintas de las guardas:',
            'id':'tinta',
            'textos':['','tinta'],
            'tabla':'tintas'
        }
    },
    'datos_interior_1':{
        'num_paginas':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Número de páginas:'
        },
        'papel_interior_1':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Papel del interior:',
            'id':'papel',
            'textos':['','papel'],
            'tabla':'papel_forro1'
        },
        'gramaje_interior_1':{
            'tipo':'number',
            'atributos':{
                'required':'required',
                'min':'1'
            },
            'val':'',
            'etiqueta':'Gramaje del interior:',
            'id':'gramaje',
            'textos':['','gramaje'],
            'tabla':'gramajes'
        },
        'tinta_interior_1':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Tintas del interior:',
            'id':'tinta',
            'textos':['','tinta'],
            'tabla':'tintas'
        },
        'acabados_interior_1':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Acabados del interior:',
            'id':'acabado',
            'textos':['','acabado'],
            'tabla':'acabados'
        },
        'suaje':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'El interior tiene suaje especial:',
            'id':'opt',
            'textos':['','opt'],
            'tabla':'opts'
        },
        'grabado':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'El interior tiene grabado:',
            'id':'opt',
            'textos':['','opt'],
            'tabla':'opts'
        }
    },
    'datos_interior_2':{
        'num_paginas':{
            'tipo':'number',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Número de páginas:'
        },
        'papel_interior_2':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Papel del interior:',
            'id':'papel',
            'textos':['','papel'],
            'tabla':'papel_forro1'
        },
        'gramaje_interior_2':{
            'tipo':'number',
            'atributos':{
                'required':'required',
                'min':'1'
            },
            'val':'',
            'etiqueta':'Gramaje del interior:',
            'id':'gramaje',
            'textos':['','gramaje'],
            'tabla':'gramajes'
        },
        'tinta_interior_2':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Tintas del interior:',
            'id':'tinta',
            'textos':['','tinta'],
            'tabla':'tintas'
        },
        'acabados_interior_2':{
            'tipo':'seleccion',
            'atributos':{
                'required':'required'
            },
            'val':'',
            'etiqueta':'Acabados del interior:',
            'id':'acabado',
            'textos':['','acabado'],
            'tabla':'acabados'
        },
        'suaje':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'El interior tiene suaje especial:',
            'id':'opt',
            'textos':['','opt'],
            'tabla':'opts'
        },
        'grabado':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'El interior tiene grabado:',
            'id':'opt',
            'textos':['','opt'],
            'tabla':'opts'
        }
    },
    'datos_caracteristicas_especiales':{
        'paginas_desplegables':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'Páginas desplegables:',
            'id':'num',
            'textos':['','num'],
            'tabla':'numeros'
        },
        'encartes':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'Encartes:',
            'id':'num',
            'textos':['','num'],
            'tabla':'numeros'
        },
        'pop_ups':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'Pop – ups:',
            'id':'num',
            'textos':['','num'],
            'tabla':'numeros'
        },
        'disco_compacto':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'Disco compacto:',
            'id':'num',
            'textos':['','num'],
            'tabla':'numeros'
        },
        'audiocinta':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'Audiocinta:',
            'id':'num',
            'textos':['','num'],
            'tabla':'numeros'
        },
        'videocinta':{
            'tipo':'seleccion',
            'atributos':null,
            'val':'',
            'etiqueta':'Videocinta:',
            'id':'num',
            'textos':['','num'],
            'tabla':'numeros'
        },
        'otras_caracteristicas_especiales':{
            'tipo':'textarea',
            'atributos':null,
            'val':'',
            'etiqueta':'Otras características especiales:'
        },
        'observaciones':{
            'tipo':'textarea',
            'atributos':null,
            'val':'',
            'etiqueta':'Observaciones:'
        }
        
    },
    'id_form':'form_registro',
    'crear_cabecera':function(seccion){
        
        let componente=$('<header>',{'id':this.id_form+'_header','class':'row bg-primary text-white mt-3'});
        let h2=$('<h2>',{'class':'text-center'});
        let p=$('<p>',{'class':'alert alert-danger text-center'});
        
        $(h2).text(`Registro de títulos`);
        
        $(componente).append(h2);
        
        return componente;
    },
    'crear_anuncios':function(){
        
        let componente=$('<section>',{'id':this.id_form+'_anuncios','class':'row'});
        let anuncio=$('<p>',{'class':'display-5 mt-5 mb-3 mx-auto font-weight-bold'}).text('Los campos en negrita son obligatorios');
        
        $(componente).append(anuncio);
        
        return componente;
    },
    'crear_datos_bibliograficos':function(){
        
        this.data['tipos_papel']={'data':[
            
            {'tipo':1},
            {'tipo':2},
            {'tipo':3},
            {'tipo':4},
            {'tipo':5},
            {'tipo':6},
            {'tipo':7},
            {'tipo':8}
        ]};
            
        this.data['bilingue']=this.bilingue;
        
        let componente=$('<section>',{'id':this.id_form+'_datos_bibliograficos','class':'mx-10','titulo':'datos_bibliograficos'});
        
        $.each(this.datos_bibliograficos,(key,dato)=>{
            
            let control=form_registro_titulos.crear_input_group(key,dato);
            $(componente).append(control);
        });
        
        return componente;
    },
    'crear_datos_tecnicos':function(){
        
        this.data['formatos']={'data':[
            
            {'formato':'horizontal'},
            {'formato':'vertical'}
        ]};
            
        let componente=$('<section>',{'id':this.id_form+'_datos_tecnicos','class':'mx-10','titulo':'datos_tecnicos'});
        
        $.each(this.datos_tecnicos,(key,dato)=>{
            
            let control=form_registro_titulos.crear_input_group(key,dato);
            $(componente).append(control);
        });
        
        return componente;
    },
    'crear_datos_encuadernacion_forros':function(){
        
        this.data['forros']={'data':[
            
            {'forro':'A caballo con 1 grapa'},
            {'forro':'A caballo con 2 grapas'},
            {'forro':'A caballo con 3 grapas'},
            {'forro':'A caballo con 4 grapas'},
            {'forro':'Acordeón'},
            {'forro':'Empalmado'},
            {'forro':'Rústica'},
            {'forro':'Rústica (espirar – wire)'},
            {'forro':'Rústica (pegada y cosida'},
            {'forro':'Rústica (pegada)'},
            {'forro':'Tapa dura - cartoné (lomo de bóveda)'},
            {'forro':'Tapa dura - cartoné (pegada y cosida)'},
            {'forro':'Tapa dura - cartoné(pegada)'}
        ]};
        
        this.data['gramajes']={'data':[

            {'gramaje':'Gramos'},
            {'gramaje':'Puntos'}
        ]};
        
        this.data['acabados']={'data':[
            
            {'acabado':'Barniz / Máquina / Mate'},
            {'acabado':'Barniz / Máquina / Brillante'},
            {'acabado':'Barniz / Barniz UV / Mate'},
            {'acabado':'Barniz / Barniz UV / Brillante'},
            {'acabado':'Plastificado / Mate'},
            {'acabado':'Plastificado / Brillante'},
            {'acabado':'Sin acabado especial'},
            {'acabado':'Otro'}
        ]};

        const forro=this.crear_group(
                this.datos_encuadernacion_forros.forro,
                this.crear_input_seleccion('forro','forros','forro',this.datos_encuadernacion_forros.forro.textos)
            );
        const forro_solapa=this.crear_group(
                this.datos_encuadernacion_forros.forro_solapa,
                this.crear_input_seleccion('forro_solapa','opts','opt',this.datos_encuadernacion_forros.forro_solapa.textos)
            );
        const papel_forro=this.crear_group(
                this.datos_encuadernacion_forros.papel_forro,
                this.crear_input_seleccion('papel_forro1','papel_forro1','papel',this.datos_encuadernacion_forros.papel_forro.textos)
            );
        $(papel_forro).append(this.crear_input_seleccion('papel_forro2','papel_forro2','papel',this.datos_encuadernacion_forros.papel_forro.textos));
        const gramaje_forro=this.crear_input_group('gramaje_forro1',this.datos_encuadernacion_forros.gramaje_forro);
        $(gramaje_forro).append(this.crear_input_seleccion('gramaje_forro2','gramajes','gramaje',this.datos_encuadernacion_forros.gramaje_forro.textos));
        const tintas_forro=this.crear_input_group('tintas_forro',this.datos_encuadernacion_forros.tintas_forro);
        const acabados_forro=this.crear_input_group('acabado_forro',this.datos_encuadernacion_forros.acabados_forro);
        const suaje=this.crear_input_group('suaje',this.datos_encuadernacion_forros.suaje);
        const grabado=this.crear_input_group('grabado',this.datos_encuadernacion_forros.grabado);
        
        const componente=$('<section>',{'id':this.id_form+'_datos_encuadernacion_forros','class':'mx-10','titulo':'datos_encuadernacion_forros'});
        
        
        $(componente).
                append(forro).
                append(forro_solapa).
                append(papel_forro).
                append(gramaje_forro).
                append(tintas_forro).
                append(acabados_forro).
                append(suaje).
                append(grabado);
        
        return componente;
    },
    'crear_datos_guardas':function(){

        const foliacion=this.crear_input_group('foliacion',this.datos_guardas.foliacion);
        const papel_guardas=this.crear_group(
                this.datos_guardas.papel_guarda,
                this.crear_input_seleccion('papel_guardas','papel_forro1','papel',this.datos_guardas.papel_guarda.textos)
            );
        $(papel_guardas).append(this.crear_input_seleccion('papel_guardas2','papel_forro2','papel',this.datos_guardas.papel_guarda.textos));
        const tintas_guarda=this.crear_input_group('tintas_guarda',this.datos_guardas.tinta_guarda);
        
        const componente=$('<section>',{'id':this.id_form+'_datos_guardas','class':'mx-10','titulo':'datos_guardas'});
        
        
        $(componente).
                append(foliacion).
                append(papel_guardas).
                append(tintas_guarda);
        
        return componente;
    },
    'crear_datos_interior_1':function(){

        const num_paginas=this.crear_input_group('num_paginas',this.datos_interior_1.num_paginas);
        const papel_interior_1=this.crear_group(
                this.datos_interior_1.papel_interior_1,
                this.crear_input_seleccion('papel_interior_1','papel_forro1','papel',this.datos_interior_1.papel_interior_1.textos)
            );
        $(papel_interior_1).append(this.crear_input_seleccion('papel_interior_1_2','papel_forro2','papel',this.datos_interior_1.papel_interior_1.textos));
        const gramaje_interior_1=this.crear_input_group('gramaje_interior_1',this.datos_interior_1.gramaje_interior_1);
        $(gramaje_interior_1).append(this.crear_input_seleccion('gramaje_interior_1_2','gramajes','gramaje',this.datos_interior_1.gramaje_interior_1.textos));
        const tinta_interior_1=this.crear_input_group('tinta_interior_1',this.datos_interior_1.tinta_interior_1);
        const acabados_interior_1=this.crear_input_group('acabados_interior_1',this.datos_interior_1.acabados_interior_1);
        const suaje=this.crear_input_group('suaje_interior_1',this.datos_interior_1.suaje);
        const grabado=this.crear_input_group('grabado_interior_1',this.datos_interior_1.grabado);
        
        const componente=$('<section>',{'id':this.id_form+'_datos_interior_1','class':'mx-10','titulo':'datos_interior_1'});
        
        
        $(componente).
                append(num_paginas).
                append(papel_interior_1).
                append(gramaje_interior_1).
                append(tinta_interior_1).
                append(acabados_interior_1).
                append(suaje).
                append(grabado);
        
        return componente;
    },
    'crear_datos_interior_2':function(){

        const num_paginas=this.crear_input_group('num_paginas_interior_2',this.datos_interior_2.num_paginas);
        const papel_interior_2=this.crear_group(
                this.datos_interior_2.papel_interior_2,
                this.crear_input_seleccion('papel_interior_2','papel_forro1','papel',this.datos_interior_2.papel_interior_2.textos)
            );
        $(papel_interior_2).append(this.crear_input_seleccion('papel_interior_2_2','papel_forro2','papel',this.datos_interior_2.papel_interior_2.textos));
        const gramaje_interior_2=this.crear_input_group('gramaje_interior_2',this.datos_interior_2.gramaje_interior_2);
        $(gramaje_interior_2).append(this.crear_input_seleccion('gramaje_interior_2_2','gramajes','gramaje',this.datos_interior_2.gramaje_interior_2.textos));
        const tinta_interior_2=this.crear_input_group('tinta_interior_2',this.datos_interior_2.tinta_interior_2);
        const acabados_interior_2=this.crear_input_group('acabados_interior_2',this.datos_interior_2.acabados_interior_2);
        const suaje=this.crear_input_group('suaje_interior_2',this.datos_interior_2.suaje);
        const grabado=this.crear_input_group('grabado_interior_2',this.datos_interior_2.grabado);
        
        const componente=$('<section>',{'id':this.id_form+'_datos_interior_2','class':'mx-10','titulo':'datos_interior_2'});
        
        
        $(componente).
                append(num_paginas).
                append(papel_interior_2).
                append(gramaje_interior_2).
                append(tinta_interior_2).
                append(acabados_interior_2).
                append(suaje).
                append(grabado);
        
        return componente;
    },
    'crear_caracteristicas_especiales':function(){

        const paginas_desplegables=this.crear_input_group('paginas_desplegables',this.datos_caracteristicas_especiales.paginas_desplegables);
        const encartes=this.crear_input_group('encartes',this.datos_caracteristicas_especiales.encartes);
        const pop_ups=this.crear_input_group('pop_ups',this.datos_caracteristicas_especiales.pop_ups);
        $(pop_ups).children('.custom-select').append($('<option>',{'value':'Más de 9'}).text('Más de 9'));
        const disco_compacto=this.crear_input_group('disco_compacto',this.datos_caracteristicas_especiales.disco_compacto);
        const audiocinta=this.crear_input_group('audiocinta',this.datos_caracteristicas_especiales.audiocinta);
        const videocinta=this.crear_input_group('videocinta',this.datos_caracteristicas_especiales.videocinta);
        const otras_caracteristicas_especiales=this.crear_input_group('otras_caracteristicas_especiales',this.datos_caracteristicas_especiales.otras_caracteristicas_especiales);
        const observaciones=this.crear_input_group('observaciones',this.datos_caracteristicas_especiales.observaciones);
        
        const componente=$('<section>',{'id':this.id_form+'_datos_caracteristicas_especiales','class':'mx-10','titulo':'datos_caracteristicas_especiales'});
        
        
        $(componente).
                append(paginas_desplegables).
                append(encartes).
                append(pop_ups).
                append(disco_compacto).
                append(audiocinta).
                append(videocinta).
                append(otras_caracteristicas_especiales).
                append(observaciones);
        
        return componente;
    },
    'crear_group':function(dato,control){
        
        const group=$('<div>',{'class':'input-group mb-3'});
        const group_prepend=$('<div>',{'class':'input-group-prepend'});
        const label_prepend=$('<span>',{'class':'input-group-text'});
        let hay_atributos=dato.atributos!==null?true:false;
        
        if(hay_atributos){
            
            $.each(dato.atributos,(atributo)=>{
                
                $(control).attr(atributo,atributo);
            });

            if(dato.atributos.required!==null){

                $(label_prepend).addClass('font-weight-bold');
            }
        }
        
        $(label_prepend).text(dato.etiqueta);
        $(group_prepend).append(label_prepend);
        
        $(group).append(group_prepend).append(control);
        
        return group;
    },
    'crear_input_group':function(nombre_control,dato){
        
        let id_frm=this.id_form;
        
        let group=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let label_prepend=$('<span>',{'class':'input-group-text'});
        let control_input='';
        let hay_atributos=dato.atributos!==null?true:false;
        
        if(dato.tipo==='checkbox'){
            
            $(group).addClass('border');
            $.each(dato['etiqueta_checkbox'],(key,etiqueta)=>{
                
                let form_check=this.crear_input_checkbox(dato,key,etiqueta);
                $(group).append(form_check);
            });
        }
        else if(dato.tipo==='textarea'){
            
            textarea=this.crear_input_textarea(nombre_control);
           control_input=textarea;
        }
        else if(dato.tipo==='btn_crear_seleccion'){
            
            let seleccion=this.crear_input_btn_seleccion(nombre_control,dato.tabla,dato.id,dato.textos);
            
            $(group).append(seleccion.children('.input-group-prepend'));
            control_input=seleccion.children('.custom-select');
        }
        else if(dato.tipo==='seleccion'){
            
            control_input=this.crear_input_seleccion(nombre_control,dato.tabla,dato.id,dato.textos,dato.etiqueta);
        }
        else{
            
            control_input=$('<input>',{
                'class':'form-control',
                'type':dato.tipo,
                'id':`form_registro_${nombre_control}`,
                'value': dato.val
            });
        }
        
        if(hay_atributos){
            
            $.each(dato.atributos,(atributo,val)=>{
                $(control_input).attr(atributo,val);
            });

            if(dato.atributos.required!==null){

                $(label_prepend).addClass('font-weight-bold');
            }
        }
        
        if(dato.tipo!=='hidden' && dato.tipo!=='btn_crear_seleccion'){

            $(label_prepend).text(dato.etiqueta);
            $(group_prepend).append(label_prepend);
            $(group).prepend(group_prepend);
        }
        
        $(group).append(control_input);
        
        return group;
    },
    'crear_input_checkbox':function(dato,key,etiqueta){
            
        let form_check=$('<div>',{'class':'form-check form-check-inline mx-auto'});
        let id_check=`${form_registro_titulos.id_form}_check_${dato.val[key]}`;
        let control=$('<input>',
            {
                'class':'form-check-input',
                'type':dato.tipo,
                'value':dato.val[key],
                'id':id_check
            });

        let label=$('<label>',{'for':id_check,'class':'form-check-label'}).text(etiqueta);

        $(form_check).append(control).append(label);
        
        return form_check;
    },
    'crear_input_textarea':function(nombre_control){
        
        textarea=$('<textarea>',{'class':'form-control','id':form_registro_titulos.id_form+'_'+nombre_control});
        
        return textarea;
    },
    'crear_input_btn_seleccion':function(nombre_control,tabla,id,textos){
        
        let componente=$('<div>');
        let nombre_btn=nombre_control.substring(0,1).toUpperCase()+nombre_control.substring(1);
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let button=$('<button>',{
            'class':'btn btn-outline-secondary btn-md m-0 px-3 py-2 z-depth-0 dropdown-toggle',
            'type':'button',
            'id':`${this.id_form}_btn_agregar_${nombre_control}`,
            'data-toggle':"dropdown",
            'aria-expanded':"false",
            'aria-haspopup':"true"
        }).text(`${nombre_btn}:`);
        let a_agregar=$('<a>',{'id':`agregar_${nombre_control}`,'class':'dropdown-item','data-toggle':'modal','data-target':'#modal_form_autores'}).text('Agregar');
        let a_eliminar=$('<button>',{
            'type':'button',
            'id':`eliminar_${nombre_control}`,
            'class':'dropdown-item'
        }).text('Eliminar');
        let menu=$('<div>',{'class':'dropdown-menu'}).append(a_agregar).append(a_eliminar);

        let select=this.crear_input_seleccion(nombre_control,tabla,id,textos);
        
        $(group_prepend).append(button).append(menu);
        $(componente).append(group_prepend).append(select);
        
        return componente;
    },
    'crear_input_seleccion':function(nombre_control,tabla,id,textos){
        
        let select=$('<select>',{'class':'custom-select','id':`${this.id_form}_${nombre_control}`});
        
        $(select).append($('<option>',{'value':false}).text(`Selecciona uno`));
        this.data[tabla].data.forEach(function(control){

            let option=$('<option>',{'value':control[id]});
            $(option).text(`${control[textos[0]]===undefined?'':control[textos[0]]+' | '}${control[textos[1]]}`);
            $(select).append(option);
        });
        
        return select;
    },
    'crear_card':function(seccion){
        
        const id=$(seccion).attr('id');
        let titulo;
        const seccion_titulo=$(seccion).attr('titulo');
        const card=$('<div>',{'id':`card_${id}`,'class':'card'});
        
        switch(seccion_titulo){
            
            case 'datos_bibliograficos':
                titulo='Datos Bibliográficos';
                break;
            case 'datos_tecnicos':
                titulo='Datos Técnicos';
                break;
            case 'datos_encuadernacion_forros':
                titulo='Datos Encuadernación y forros';
                break;
            case 'datos_guardas':
                titulo='Guardas';
                break;
            case 'datos_interior_1':
                titulo='Interior 1';
                break;
            case 'datos_interior_2':
                titulo='Interior 2';
                break;
            case 'datos_caracteristicas_especiales':
                titulo='Características especiales';
                break;
        }
        
        const card_header=$('<div>',{'id':seccion_titulo,'class':'card-header'});
        const h3=$('<h3>',{'class':'mb-0'});
        const button=$('<button>',{
            'class':'btn btn-link btn-block text-left collapsed',
            'type':'button',
            'data-toggle':"collapse",
            'data-target':`#collapse_${seccion_titulo}`,
            'aria-expanded':false,
            'aria-controls':`collapse_${seccion_titulo}`
        });
        
        $(button).text(titulo);
        $(h3).append(button);
        $(card_header).append(h3);
        
        
        const collapse=$('<div>',{
            'id':`collapse_${seccion_titulo}`,
            'class':'collapse',
            'aria-labelledby':seccion_titulo,
            'data-parent':`#${id}`
        });
        const card_body=$('<div>',{'class':'card-body'});
        
        $(card_body).append(seccion);
        $(collapse).append(card_body);
        
        $(card).append(card_header).append(collapse);
        
        return card;
    },
    'crear_acordion':function(secciones){
        
        let acordion=$('<div>',{'id':'acordion','class':'accordion'});
        
        secciones.forEach(titulo=>{
            
            $(acordion).append(titulo);
        });
        
        return acordion;
    },
    'render':function(){
        
        this.data['opts']={'data':[
            
            {'opt':'Si'},
            {'opt':'No'}
        ]};
        this.data['papel_forro1']={'data':[

            {'papel':'Couché o similares'},
            {'papel':'Bond o similares'},
            {'papel':'Otro'}
        ]};
        this.data['papel_forro2']={'data':[

            {'papel':'Mate'},
            {'papel':'Brillante'}
        ]};
        this.data['tintas']={'data':[
            
            {'tinta':'1x0'},
            {'tinta':'1x1'},
            {'tinta':'2x0'},
            {'tinta':'2x1'},
            {'tinta':'2x2'},
            {'tinta':'3x0'},
            {'tinta':'3x1'},
            {'tinta':'3x2'},
            {'tinta':'3x3'},
            {'tinta':'4x0'},
            {'tinta':'4x1'},
            {'tinta':'4x2'},
            {'tinta':'4x3'},
            {'tinta':'4x4'},
            {'tinta':'5x0'},
            {'tinta':'5x1'},
            {'tinta':'5x2'},
            {'tinta':'5x3'},
            {'tinta':'5x4'},
            {'tinta':'5x5'},
            {'tinta':'Sin tinta'}
        ]};
        this.data['gramajes']={'data':[

            {'gramaje':'Gramos'},
            {'gramaje':'Puntos'}
        ]};
        this.data['acabados']={'data':[
            
            {'acabado':'Barniz / Máquina / Mate'},
            {'acabado':'Barniz / Máquina / Brillante'},
            {'acabado':'Barniz / Barniz UV / Mate'},
            {'acabado':'Barniz / Barniz UV / Brillante'},
            {'acabado':'Plastificado / Mate'},
            {'acabado':'Plastificado / Brillante'},
            {'acabado':'Sin acabado especial'},
            {'acabado':'Otro'}
        ]};
        this.data['numeros']={'data':[
            
            {'num':1},
            {'num':2},
            {'num':3},
            {'num':4},
            {'num':5},
            {'num':6},
            {'num':7},
            {'num':8}
        ]};
        
        const contenedor=$('<article>',{'id':this.id_form,'class':'container-fluid border'});
        const formulario=$('<form>',{'id':'form_registro','class':"needs-validation",'novalidate':'novalidate'});
        const datos_bibliograficos=this.crear_card(this.crear_datos_bibliograficos());
        const datos_tecnicos=this.crear_card(this.crear_datos_tecnicos());
        const datos_encuadernacion_forros=this.crear_card(this.crear_datos_encuadernacion_forros());
        const datos_guarda=this.crear_card(this.crear_datos_guardas());
        const datos_interior_1=this.crear_card(this.crear_datos_interior_1());
        const datos_interior_2=this.crear_card(this.crear_datos_interior_2());
        const datos_caracteristicas_especiales=this.crear_card(this.crear_caracteristicas_especiales());
        const acordion=this.crear_acordion([
            datos_bibliograficos,
            datos_tecnicos,
            datos_encuadernacion_forros,
            datos_guarda,
            datos_interior_1,
            datos_interior_2,
            datos_caracteristicas_especiales
        ]);
        const btn_enviar=$('<button>',{
            'type':'submit',
            'id':'btn_enviar_registro',
            'class':'btn btn-primary'
        }).text('Registrar título');
        const btn_cancelar=$('<button>',{
            'type':'reset',
            'id':'btn_cancelar_registro',
            'class':'btn btn-danger'
        }).text('Cancelar registrar');
        const btns=$('<div>',{'class':'mx-auto'});
        
        $(btns).append(btn_enviar).append(btn_cancelar);
        $(formulario).append(acordion).append(btns);
        
        $(contenedor).append(this.crear_cabecera('Datos Bibliográficos')).append(this.crear_anuncios()).append(formulario);
        
        return contenedor;
    }
};
//--------------------------------------------------------------------------

/* ****************************** *
* ***** Formulario de Autor ***** *
* ******************************* */
let form_autor={
    'data':'',
    'id_form':'form_autores',
    'header_create':function(){
        
        let componente=$('<div>',{'id':this.id_form+'_header','class':'modal-header'});
        let h5=$('<h5>',{'class':'modal-title'});
        let button=$('<button>',{'class':'close','data-dismiss':'modal','aria-label':'Cerrar'});
        let span=$('<span>',{'aria-hidden':true});
        
        
        $(h5).text('Agregar Autor');
        $(span).html('&times;');
        
        $(componente).append(h5);
        $(button).append(span);
        $(componente).append(button);
        
        return componente;
    },
    'body_create':function(){
        
        let tipos=[
            {'id':1,'tipo':'Autor'},
            {'id':2,'tipo':'Antologado'},
            {'id':3,'tipo':'Ilustador'},
            {'id':4,'tipo':'Traductor'},
            {'id':5,'tipo':'Compilador'},
            {'id':6,'tipo':'Coordinador'},
            {'id':7,'tipo':'Adaptador'}
        ];
        let componente=$('<div>',{'class':'modal-body'});
        let form=$('<form>',{'id':this.id_form,'class':'was-validated'});
        
        //Tipo de autor.
        let atributos_control={'required':'required'};
        let tipo_autor=this.group_select_create('tipo_autor',tipos,'Tipo de Autor',[atributos_control],'tipo','tipo');
        
        //Nombre Completo
        atributos_control={'required':'required'};
        let nombre=this.input_group_create('nombre','','Nombre Completo',[atributos_control]);
        
        //País de origen.
        atributos_control={'required':'required'};
        let paises=this.data.paises.data;
        let pais_origen=this.group_select_create('pais_origen',paises,'País de origen',[atributos_control],'pai_pais','pai_pais');
        
        $(form).append(tipo_autor);
        $(form).append(nombre);
        $(form).append(pais_origen);
        $(componente).append(form);
        
        return componente;
    },
    'footer_create':function(){
        
        let componente=$('<div>',{'class':'modal-footer'});
        let btn_cerrar=$('<button>',{'class':'btn btn-secondary','data-dismiss':'modal'});
        let btn_guardar=$('<button>',{'class':'btn btn-primary','type':'submit','form':this.id_form});
        
        $(btn_cerrar).text('Cerrar');
        $(btn_guardar).text('Crear Autor');
        
        $(componente).append(btn_cerrar);
        $(componente).append(btn_guardar);
        
        return componente;
    },
    'input_group_create':function(nombre_control,val_control,texto_etiqueta,atributos,tipo='text'){
        
        let id_frm=this.id_form;
        
        let group=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let label=$('<span>',{'class':'input-group-text'});
        let control=$('<input>',{'class':'form-control','type':tipo,'id':id_frm+'_'+nombre_control});
        
        atributos.forEach(function(atributo){
            
            $(control).attr(atributo);
        });
        
        $(label).text(texto_etiqueta);
        $(control).val(val_control);
        $(group_prepend).append(label);
        $(group).append(group_prepend).append(control);
        
        return group;
    },
    'group_select_create':function(nombre_control,val_control,texto_etiqueta,atributos,element_val,element_text){
        
        let id_frm=this.id_form;
        
        let group=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let label=$('<span>',{'class':'input-group-text'});
        let control=$('<select>',{'class':'custom-select','id':id_frm+'_'+nombre_control});
        
        atributos.forEach(function(atributo){
            
            $(control).attr(atributo);
        });
        
        val_control.forEach(function(elemento){

            let option=$('<option>',{'value':elemento[element_val]});
            $(option).text(elemento[element_text]);
            $(control).append(option);
        });
        
        $(label).text(texto_etiqueta);
        $(group_prepend).append(label);
        $(group).append(group_prepend).append(control);
        
        return group;
    },
    'modal_form_create':function(){
        
        let componente=$('<div>',{
            'id':'modal_'+this.id_form,
            'role':'form',
            'class':'modal fade',
            'tabindex':'-1',
            'aria-hidden':'true'
        });
        let dialog=$('<div>',{'class':'modal-dialog'});
        let content=$('<div>',{'class':'modal-content'});
        let header=this.header_create();
        let body=this.body_create();
        let footer=this.footer_create();
        
        $(content).append(header);
        $(content).append(body);
        $(content).append(footer);
        $(dialog).append(content);
        
        $(componente).append(dialog);
        
        return componente;
    },
    'render':function(){
        
        return this.modal_form_create();
    }
};
//--------------------------------------------------------------------------

/* ************************************************ *
* ***** Formulario de activación de editorial ***** *
* ************************************************* */
let form_activacion_editorial={
    'data':'',
    'id_form':'form_activacion_editorial',
    'desalertar':function(){
        this.estado.alertado=false;
        this.estado.mensaje='';
    },
    'alertar':function(mensaje){
        this.estado.alertado=true;
        this.estado.mensaje=mensaje;
    },
    'estado':{
        alertado:false,
        mensaje:''
    },
    'header_create':function(){
        
        let componente=$('<header>',{'id':this.id_form+'_header','class':'jumbotron'});
        let h2=$('<h2>',{'class':'text-center'});
        let p=$('<p>',{'class':'alert alert-danger text-center'});
        
        $(h2).text('Datos de editorial');
        
        $(componente).append(h2);
                
        if(this.estado.alertado){
            $(p).text(this.estado.mensaje);
            $(componente).append(p);
        }
        
        return componente;
    },
    'form_create':function(){
        
        let componente=$('<form>',{'id':this.id_form});
        let atributos_control;
        
        //Razón social
        atributos_control={'disabled':'disabled','required':'required'};
        let razon_social=this.data.editorial.data[0].edi_razonsocial;
        razon_social=this.group_input_create('razon_social',razon_social,'Razón Social',[atributos_control]);
        
        //RFC
        atributos_control={'required':'required'};
        let rfc=this.data.editorial.data[0].edi_rfc;
        rfc=this.group_input_create('rfc',rfc,'R.F.C.',[atributos_control]);
        
        //Grupo Editorial
        atributos_control={'required':'required'};
        let grupo_editorial=this.data.editorial.data[0].edi_grupoedit;
        grupo_editorial=this.group_input_create('grupo_editorial',grupo_editorial,'Grupo Editorial',[atributos_control]);
        
        //Sellos Editoriales
        atributos_control={'readonly':'readonly'};
        let sellos_editoriales=this.data.sellos_editoriales.data;
        let txt_sellos_editoriales='';
        sellos_editoriales.forEach(sello=>{
            
            txt_sellos_editoriales+=sello.sel_sello+'\r\n';
        });
        sellos_editoriales=this.group_textarea_create('sellos_editoriales',txt_sellos_editoriales,'Sellos Editoriales',[atributos_control]);;
        
        //Edición de autor
        atributos_control={'readonly':'readonly'};
        let edicion_autor=this.group_input_create('edicion_autor','No','Edición de Autor',[atributos_control]);
        
        //Colonia
        atributos_control={'required':'required'};
        let colonia=this.data.editorial.data[0].edi_colonia;
        colonia=this.group_input_create('colonia',colonia,'Colonia',[atributos_control]);
                
        //Calle
        atributos_control={'required':'required'};
        let calle=this.data.editorial.data[0].edi_calle;
        calle=this.group_input_create('calle',calle,'Calle',[atributos_control]);

        //Número Exterior
        atributos_control={'required':'required'};
        let numero_exterior=this.data.editorial.data[0].edi_numero;
        numero_exterior=this.group_input_create('numero_exterior',numero_exterior,'Núm. Exterior e Interior',[atributos_control]);
        
        //Código Postal
        atributos_control={'required':'required'};
        let cp=this.data.editorial.data[0].edi_cp;
        cp=this.group_input_create('cp',cp,'Código postal',[atributos_control],'number');
        
        //Ciudad
        atributos_control={'required':'required'};
        let ciudad=this.data.editorial.data[0].edi_ciudad;
        ciudad=this.group_input_create('ciudad',ciudad,'Ciudad',[atributos_control]);
        
        //Pais
        atributos_control={'required':'required'};
        let pais=this.data.paises.data;
        pais=this.group_select_create('pais',pais,'País',[atributos_control],'pai_pais','pai_pais');
        
        //Entidad Federativa
        atributos_control={};
        let entidad_federativa='';
        entidad_federativa=this.group_input_create('entidad_federativa',entidad_federativa,'Entidad Federativa',[atributos_control]);
        
        //Delegación o Municipio
        atributos_control={};
        let del_mun='';
        del_mun=this.group_input_create('del_mun',del_mun,'Delegación o Municipio',[atributos_control]);
        
        //Teléfonos
        atributos_control={'required':'required'};
        let telefono='';
        telefono=this.group_input_create('telefono',telefono,'Teléfono',[atributos_control]);
        
        //Correo Electrónico
        atributos_control={'required':'required'};
        let email='';
        email=this.group_input_create('email',email,'Correo Electrónico',[atributos_control],'email');
        
        //Nombre Titular
        let fieldset=$('<fieldset>');
        let legend=$('<legend>');
        legend.text('Representante/Titular');
        $(fieldset).append(legend);
        atributos_control={'disabled':'disabled','required':'required'};
        let nombre_titular=this.data.editorial.data[0].edi_repnombre;
        nombre_titular=this.group_input_create('nombre_titular',nombre_titular,'Nombre',[atributos_control]);
        
        //Cargo Titular
        atributos_control={'disabled':'disabled','required':'required'};
        let cargo_titular=this.data.editorial.data[0].edi_repcargo;
        cargo_titular=this.group_input_create('cargo_titular',cargo_titular,'Cargo del Representante',[atributos_control]);
        
        //Obcervaciones
        atributos_control={'disabled':'disabled'};
        let observaciones=this.data.editorial.data[0].edi_observaciones;
        observaciones=this.group_textarea_create('observaciones',observaciones,'Detalles',[atributos_control]);
        
        $(fieldset).append(nombre_titular).append(cargo_titular).append(observaciones);
        
        $(componente).append(razon_social);
        $(componente).append(rfc);
        $(componente).append(grupo_editorial);
        $(componente).append(sellos_editoriales);
        $(componente).append(edicion_autor);
        $(componente).append(colonia);
        $(componente).append(calle);
        $(componente).append(numero_exterior);
        $(componente).append(cp);
        $(componente).append(ciudad);
        $(componente).append(pais);
        $(componente).append(entidad_federativa);
        $(componente).append(del_mun);
        $(componente).append(telefono);
        $(componente).append(email);
        $(componente).append(fieldset);
        
        return componente;
    },
    'group_input_create':function(nombre_control,val_control,texto_etiqueta,atributos,tipo='text'){
        
        let id_frm=this.id_form;
        
        let group=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let label=$('<span>',{'class':'input-group-text'});
        let control=$('<input>',{'class':'form-control','type':tipo,'id':id_frm+'_'+nombre_control});
        
        atributos.forEach(function(atributo){
            
            $(control).attr(atributo);
        });
        
        $(label).text(texto_etiqueta);
        $(control).val(val_control);
        $(group_prepend).append(label);
        $(group).append(group_prepend).append(control);
        
        return group;
    },
    'group_select_create':function(nombre_control,val_control,texto_etiqueta,atributos,element_val,element_text){
        
        let id_frm=this.id_form;
        
        let group=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let label=$('<span>',{'class':'input-group-text'});
        let control=$('<select>',{'class':'custom-select','id':id_frm+'_'+nombre_control});
        
        atributos.forEach(function(atributo){
            
            $(control).attr(atributo);
        });
        
        val_control.forEach(function(elemento){
            
            let option=$('<option>',{'value':elemento[element_val]});
            $(option).text(elemento[element_text]);
            $(control).append(option);
        });
        
        $(label).text(texto_etiqueta);
        $(group_prepend).append(label);
        $(group).append(group_prepend).append(control);
        
        return group;
    },
    'group_textarea_create':function(nombre_control,val_control,texto_etiqueta,atributos){
        
        let id_frm=this.id_form;
        
        let group=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let label=$('<span>',{'class':'input-group-text'});
        let control=$('<textarea>',{'class':'form-control','id':id_frm+'_'+nombre_control});
        
        atributos.forEach(function(atributo){
            
            $(control).attr(atributo);
        });
        
        $(label).text(texto_etiqueta);
        $(control).val(val_control);
        $(group_prepend).append(label);
        $(group).append(group_prepend).append(control);
        
        return group;
    },
    'modal_form_create':function(){
        
        let componente=$('<div>',{'role':'form'});
        let modal_dialog=$('<div>',{'class':'modal-dialog modal-xl'});
        let modal_content=$('<div>',{'class':'modal-content'});
        let modal_header=$('<div>',{'class':'modal-header'});
        let modal_title=$('<h5>',{'class':'modal-title'});
        let modal_body=$('<h5>',{'class':'modal-body'});
        let modal_footer=$('<div>',{'class':'modal-footer'});
        let boton_salvar=$('<button>',{'class':'btn btn-primary','type':'submit','form':this.id_form});
        let form=this.form_create();
        
        $(modal_title).text('Datos de la editorial '+this.data.editorial.data[0].edi_razonsocial);
        $(boton_salvar).text('Guardar');
        $(modal_header).append(modal_title);
        $(modal_body).append(form);
        $(modal_footer).append(boton_salvar);
        $(modal_content).append(modal_header).append(modal_body).append(modal_footer);
        $(modal_dialog).append(modal_content);
        $(componente).append(modal_dialog);
        
        return componente;
    },
    'render':function(){
        
        let contenedor=$('#contenedor_principal');
        
        $(contenedor).append(this.header_create()).append(this.modal_form_create());
    }
};
//--------------------------------------------------------------------------
