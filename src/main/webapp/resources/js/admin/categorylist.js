/**
 * Multi Select Box - jQuery plugin
 *
 * @author artherot
 * @version 1.0
 * @since 1.0
 * @copyright Copyright (c), Godosoft
 */
(function($){
    $.fn.multi_select_box = function(selectID, cnt, url, emptyText) {
    
        return this.each(function(index, domEle) {
    
            $(this).change( function(event)
            {
                var thisID		= event.currentTarget.id;
                var selectPanel	= parseInt(thisID.substr((selectID.length - 1),1)) + 1;
                var targetID	= selectID + selectPanel;
                var parameters	= { mod_type:selectPanel, ca_id:$(this).val() };
                var tmpID		= '';	
            
                postCallback = function(data)
                {
                    if (emptyText !='' && emptyText != null)
                    {
                        for (var i = selectPanel; i <= cnt; i++)
                        {
                            tmpID	= selectID + i;
                            $(tmpID).html('<option value="">'+emptyText+'</option>');
                        }
                    }	
                    
                    data = eval(data);	
                    if (data !='' && data != null) {
                        $(targetID).html('');
                        var k = 1;
                        for (var j = 0; j < data.length; j++)
                        {
                            if(j == 0)
                            {
                                $(targetID).get(0).add(new Option(emptyText,''), document.all ? j : null);
                            }
                            k	= k + j
    
                            $('<option/>', {
                                text: data[j]['optionText'],
                                value: data[j]['optionValue'],
                                data: {
                                    flag: data[j]['flag'],
                                    mallName: data[j]['mallName']
                                }
                            }).appendTo(targetID);
                        }
                    }
                }
    
                if(url) {
                    $.post( url, parameters, postCallback );
                }
            });
        });
    }
    })(jQuery);