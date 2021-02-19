'use strict';

/* ******************* *
* ***** Cabecera ***** *
* ******************** */
var cabecera={
    crear_btn_group:function(btns){
        
        let btn_group=$('<div>',{'class':'btn-group ml-auto'});
        
        btns.forEach(btn=>{
            
            $(btn_group).append($('<button>',{'id':btn.id,'type':'button','class':'btn btn-secondary'}).text(btn.valor));
        });
        
        return btn_group;
    },
    render:function(){
        let encabezado=$('<div>',{'class':'container-fluid border'});
        let titulo='Registro de títulos';
        let row_titulo=$('<div>',{'class':'row text-left ml-4 mt-4'});
        let row_btns_accion=$('<div>',{'class':'row text-right'});
        
        
        let h2=$('<h2>',{'class':'display-6'}).text(titulo);
        $(row_titulo).append(h2);
        
        $(row_btns_accion).append(this.crear_btn_group([
            {
                'id':'btn_ejemplo_etiquetas',
                'valor':'Ejemplo para etiquetas'
            },
            {
                'id':'btn_titulos_registrados',
                'valor':'Titulos registrados (Excel)'
            },
            {
                'id':'btn_lista_oficial',
                'valor':'Lista oficial Títulos Registrados'
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
var btn_registrar_titulo={
    
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
var tabla_titulos_registrados={
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
                {'data':'edi_id','title':'Folio'},
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
                                    href="${base_url}editorial/registro_titulos/crear_acuse/${data}"
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

var form_registro_titulos={
    'data':'',
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
                'required':'required'
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
            'tipo':'textarea',
            'atributos':null,
            'val':'',
            'etiqueta':'Material en lengua indigena:'
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
    'id_form':'form_registro',
    'crear_cabecera':function(seccion){
        
        let componente=$('<header>',{'id':this.id_form+'_header','class':'row bg-primary text-white mt-3'});
        let h2=$('<h2>',{'class':'text-center'});
        let p=$('<p>',{'class':'alert alert-danger text-center'});
        
        $(h2).text(`Registro de títulos - ${seccion}`);
        
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
            
        let componente=$('<section>',{'id':this.id_form+'_datos_bibliograficos','class':'mx-10'});
        
        $.each(this.datos_bibliograficos,(key,dato)=>{
            
            let control=form_registro_titulos.crear_input_group(key,dato);
            $(componente).append(control);
        });
        
        return componente;
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
            
            control_input=this.crear_input_seleccion(nombre_control,dato.tabla,dato.id,dato.textos);
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
            
            $.each(dato.atributos,(atributo)=>{
                
                $(control_input).attr(atributo,atributo);
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
        
        $(select).append($('<option>',{'value':false}).text(`Selecciona un ${nombre_control}`));
        this.data[tabla].data.forEach(function(control){

            let option=$('<option>',{'value':control[id]});
            $(option).text(`${control[textos[0]]===undefined?'':control[textos[0]]+' | '}${control[textos[1]]}`);
            $(select).append(option);
        });
        
        return select;
    },
    'render':function(){
        
        let contenedor=$('<article>',{'id':this.id_form,'class':'container-fluid border'});
        let formulario=$('<form>',{'id':'form_registro','class':"needs-validation",'novalidate':'novalidate'});
        let btn_accion=$('<button>',{
            'type':'submit',
            'id':'btn_enviar_registro',
            'class':'btn btn-primary ml-auto'
        }).text('Registrar título');
        
        $(formulario).append(this.crear_datos_bibliograficos()).append(btn_accion);
        
        $(contenedor).append(this.crear_cabecera('Datos Bibliográficos')).append(this.crear_anuncios()).append(formulario);
        
        return contenedor;
    }
};

var form_autor={
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

var form_activacion_editorial={
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

