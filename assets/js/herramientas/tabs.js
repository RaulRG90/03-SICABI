var tabs={
    render:function(tabs_item){
        
        let ul_tabs=$('<ul>',{'class':'nav nav-tabs'});
        let tab_content=$('<div>',{'class':'tab-content','id':"tab_content"});
        let num_tabs=0;
        let component=$('<div>');
        
        tabs_item.forEach(function(tab){
            if(num_tabs===0){
                $(ul_tabs).append(tabs.tab_item(tab.toLowerCase(),tab,'true','active'));
                $(tab_content).append(tabs.tab_pane(tab.toLowerCase(),'show active'));
            }
            else{
                $(ul_tabs).append(tabs.tab_item(tab.toLowerCase(),tab,'false'));
                $(tab_content).append(tabs.tab_pane(tab.toLowerCase()));
            }
            num_tabs++;
        });
        
        $(component).append(ul_tabs).append(tab_content);
        return component;
    },
    tab_item:function(id,link_text,selected='false',active=''){
        
        let item=$('<li>',{'class':'nav-item','role':'presentation'});
        let link=$('<a>',{
            'id':'tab_'+id,
            'class':'nav-link '+active,
            'data-toggle':'tab',
            'href':'#pane_'+id,
            'aria-controls':'pane_'+id,
            'aria-selected':selected
        });
        
        $(link).text(link_text);
        $(item).append(link);
        
        return item;
    },
    tab_pane:function(id,show_active=''){
        
        let tab_pane=$('<div>',{
            'id':'pane_'+id,
            'class':'tab-pane fade '+show_active,
            'aria-labelledby':'tab_'+id
        });
        
        return tab_pane;
    }
};