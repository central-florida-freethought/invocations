!function(i){var a,e=i("#user_meeting_speaker_attributes_name"),t=i("#searchResults"),n=i("#user_meeting_speaker_attributes_religion_id"),s=i("#user_meeting_speaker_attributes_honorific"),r=i("#user_meeting_speaker_attributes_organization_attributes_name");e.bind("keypress focus",function(){var o=i(this).val();t.empty().removeClass("hide"),n.prop("disabled",!1),s.prop("disabled",!1),r.prop("disabled",!1),i.ajax({type:"get",url:"/speakers/search.json",datatype:"json",data:{name:o},success:function(a){var e="<ul>";i.each(a,function(i,a){e+='<li data-religion_id="'+a.religion_id+'" data-honorific="'+a.honorific+'" data-organization_id="'+a.organization_id+'">'+a.name+"</li>"}),e+="</ul>",t.append(e)},complete:function(){a=t.find("li"),a.click(function(){e.val(this.innerHTML),n.val(i(this).data("religion_id")),n.prop("disabled",!0),s.val(i(this).data("honorific")),s.prop("disabled",!0),r.val(""),i.getJSON("/org/"+i(this).data("organization_id")+".json",function(i){r.val(i.name)}),r.prop("disabled",!0)})}})}),i(document.body).click(function(a){var n=i(a.target);n.is(e)||n.is(t)||n.is("input")||t.addClass("hide")})}(jQuery);