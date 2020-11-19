'use strict';
var login={
    sistema:'',
    render:function(nom_sistema='SICABI'){
        
        let div_principal=$('<div>',{'class':'row no-gutter'});
        let div_col=$('<div>',{'class':'col-md-8 col-lg-5'});
        let div_login=$('<div>',{'class':'login d-flex'});
        let div_img=$('<div>',{'class':'d-none d-md-flex col-md-4 col-lg-7 bg-image'});
        //Definir datos del componente.
        this.sistema=nom_sistema;
        
        //Agregar datos a componentes
        
        //Armar componentes
        $(div_login).append(this.login_container());
        $(div_col).append(div_login);
        $(div_principal).append(div_col).append(div_img);
        
        return div_principal;
    },
    login_container:function(){
        
        //Crear componentes
        let div_container=$('<div>',{'class':'container'});
        let div_row=$('<div>',{'class':'row'});
        let div_col=$('<div>',{'class':'col-md-9 col-lg-8 mx-auto py-5'});
        let div_pie=$('<div>',{'class':'text-center mt-4 pt-4 align-bottom mx-auto'});
        let span_pie=$('<span>',{'class':'pt-4 align-bottom text-center'});
        
        //Agregar datos a componentes
        $(span_pie).text('Secretaría de Educación Pública');
        
        //Armar componentes
        $(div_col).append(this.login_heading()).append(this.login_form());
        $(div_row).append(div_col);
        $(div_pie).append(span_pie);
        $(div_container).append(div_row).append(div_pie);
        
        return div_container;
    },
    login_heading:function(){
        
        //Crear componentes
        let h5_heading=$('<h5>',{'class':'login-heading mb-5 pb-5 font-weight-bold text-center'});
        
        //Agregar datos a componentes
        $(h5_heading).text(this.sistema);
        
        return h5_heading;
    },
    login_form:function(){
        
        //Crear componentes
        let form_login=$('<form>',{'id':'frm_login'});
        let span_usuario=$('<span>',{'class':'font-weight-bold'});
        let div_group_usuario=$('<div>',{'class':'form-label-group'});
        let input_usuario=$('<input>',{'id':'input_usuario','class':'form-control','type':'text','required':'required','autofocus':'autofocus','autocomplete':'username'});
        let span_contrasenia=$('<span>',{'class':'font-weight-bold'});
        let div_group_contrasenia=$('<div>',{'class':'form-label-group'});
        let input_contrasenia=$('<input>',{'id':'input_password','class':'form-control','type':'password','required':'required','autocomplete':'current-password'});
        let input_latitude=$('<input>',{'type':'hidden','id':'input_latitude','class':'form-control'});
        let input_longitude=$('<input>',{'type':'hidden','id':'input_longitude','class':'form-control'});
        let button_submit=$('<button>',{'class':'btn btn-lg btn-login font-wight-light white-text mb-2','type':'submit'});
        
        //Agregar datos a componentes
        $(span_usuario).text('Usuario');
        $(span_contrasenia).text('Contraseña');
        $(button_submit).text('Ingresar');
        
        //Armar componentes
        $(div_group_usuario).append(input_usuario);
        $(div_group_contrasenia).append(input_contrasenia);
        $(form_login).append(span_usuario).append(div_group_usuario).append(span_contrasenia).append(div_group_contrasenia).append(input_latitude).append(input_longitude).append(button_submit);
        
        return form_login;
    }
};


