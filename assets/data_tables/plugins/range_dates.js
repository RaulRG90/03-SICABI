/**
 * Filter a column on a specific date range. Note that you will likely need 
 * to change the id's on the inputs and the columns in which the start and 
 * end date exist.
 *
 *  @name Date range filter
 *  @summary Filter the table based on two dates in different columns
 *  @author _guillimon_
 *
 *  @example
 *    $(document).ready(function() {
 *        var table = $('#example').DataTable();
 *         
 *        // Add event listeners to the two range filtering inputs
 *        $('#min').keyup( function() { table.draw(); } );
 *        $('#max').keyup( function() { table.draw(); } );
 *    } );
 */
$(document).ready(function(){
    let fecha=new Date();
    let dia=fecha.getDate();
    let mes=(fecha.getMonth() +1);
    let anio=fecha.getFullYear();

    if(dia<10) dia='0'+dia; //agrega cero si el menor de 10
    if(mes<10) mes='0'+mes; //agrega cero si el menor de 10

    let hoy=anio+"-"+mes+"-"+dia;

    $.fn.dataTableExt.afnFiltering.push(
	function( oSettings, aData, iDataIndex ) {
            
            var iFini = document.getElementById('fini') !== null?document.getElementById('fini').value:hoy;
            var iFfin = document.getElementById('ffin') !== null?document.getElementById('fini').value:hoy;
                
            var iStartDateCol = (aData.length-1);
            var iEndDateCol = (aData.length-1);

//		iFini=iFini.substring(6,10) + iFini.substring(3,5)+ iFini.substring(0,2);
//		iFfin=iFfin.substring(6,10) + iFfin.substring(3,5)+ iFfin.substring(0,2);
                
//		var datofini=aData[iStartDateCol].substring(6,10) + aData[iStartDateCol].substring(3,5)+ aData[iStartDateCol].substring(0,2);
//		var datoffin=aData[iEndDateCol].substring(6,10) + aData[iEndDateCol].substring(3,5)+ aData[iEndDateCol].substring(0,2);

                var datofini=aData[iStartDateCol];
		var datoffin=aData[iEndDateCol];


		if ( iFini === "" && iFfin === "" )
		{
			return true;
		}
		else if ( iFini <= datofini && iFfin === "")
		{
			return true;
		}
		else if ( iFfin >= datoffin && iFini === "")
		{
			return true;
		}
		else if (iFini <= datofini && iFfin >= datofini)
		{
			return true;
		}
		return false;
	}
    );
});