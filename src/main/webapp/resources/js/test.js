var category_change = "";
$(document).on("click", "[name='list_checkbox_all']", function() {
	if ($(this).prop("checked") == true) {
		$(this).parents(".list_checkbox_wrap").find(".list_checkbox").find(":checkbox").prop("checked", false).change();
	}
	menu();
});
$(document).on("click", "[name='list_checkbox']", function() {
	$(this).parents(".list_checkbox_wrap").find("[name='list_checkbox_all']").prop("checked", false).change();
	if ($(this).parents(".list_checkbox_wrap").find("[name='list_checkbox']").length == $(this).parents(".list_checkbox").find("[name='list_checkbox']:checked").length) {
		$(this).parents(".list_checkbox_wrap").find("[name='list_checkbox_all']").prop("checked", true).change();
	} else {
		$(this).parents(".list_checkbox_wrap").find("[name='list_checkbox_all']").prop("checked", false).change();
	}
	menu();
});
$(document).on("click", ".board_page_link", function() {
	var page = $(this).data("page");
	menu(page);
	$("html").animate({ scrollTop: $(".menu_box").offset().top - 200 }, 0);
});
$(document).ready(function() {
	menu();
});
function menu(page) {
	var list_checkbox_all = $("input[name='list_checkbox_all']:checked").val();
	var checkbox = [];
	$("input[name='list_checkbox']:checked").each(function(i) {
		checkbox.push($(this).val());
	});
	var checklist_join = checkbox.join(",");
	$.ajax({
		url: "menu.php",
		type: "GET",
		data: {
			"page": page,
			"menu_category1": '1',
			"menu_category2": '1',
			"category": checklist_join,
			"list_checkbox_all": list_checkbox_all,
		},
		success: function(result) {
			$("#menu_list").html(result);
			cont_gallery_list_img();
		}
	});
};