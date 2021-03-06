var validator;
var $menuAddForm = $("#menu-add-form");
var $menuName = $menuAddForm.find("input[name='menuName']");
var $url = $menuAddForm.find("input[name='url']");
var $icon = $menuAddForm.find("input[name='icon']");
var $icon_drop = $menuAddForm.find("div.icon-drop");

var $menuUrlListRow = $menuAddForm.find(".menu-url-list-row");
var $menuIconListRow = $menuAddForm.find(".menu-icon-list-row");
var $menuPermsListRow = $menuAddForm.find(".menu-perms-list-row");

$(function () {
    $icon_drop.hide();
    validateRule();
    createMenuTree();

    $menuAddForm.find("input[name='type']").change(function () {
        var $value = $menuAddForm.find("input[name='type']:checked").val();
        if ($value === 'menu') {
            $menuName.parent().prev().text("菜单名称：");
            $menuUrlListRow.show();
            $menuIconListRow.show();
        } else {
            $menuName.parent().prev().text("按钮名称：");
            $menuUrlListRow.hide();
            $menuIconListRow.hide();
        }
    });

    $menuAddForm.find("input[name='icon']").focus(function () {
        $icon_drop.show();
    });

    $("#menu-add").click(function (event) {
        var obj = event.srcElement || event.target;
        if (!$(obj).is("input[name='icon']")) {
            $icon_drop.hide();
        }
    });

    $icon_drop.find(".menu-icon .col-sm-6").on("click", function () {
        var icon = "zmdi " + $(this).find("i").attr("class").split(" ")[1];
        $icon.val(icon);
    });


    /**
     * 菜单新增点击事件
     */
    $("#menu-add .btn-save").click(function () {
        $menuPermsListRow.find("input[name='perms']").val(
            $menuPermsListRow.find(".autocomplete-input").val()
        );
        $menuUrlListRow.find("input[name='url']").val(
            $menuUrlListRow.find(".autocomplete-input").val()
        );
        var name = $(this).attr("name");
        getMenu();
        validator = $menuAddForm.validate();
        var flag = validator.form();
        if (flag) {
            if (name === "save") {
                $.post( "menu/add", $menuAddForm.serialize(), function (r) {
                    if (r.code === 200) {
                        refresh();
                        closeModal();
                        $MB.n_success(r.message);
                    } else $MB.n_danger(r.message);
                });
            }
            if (name === "update") {
                $.post( "menu/update", $menuAddForm.serialize(), function (r) {
                    if (r.code === 200) {
                        refresh();
                        closeModal();
                        $MB.n_success(r.message);
                    } else $MB.n_danger(r.message);
                });
            }
        }
    });

    $("#menu-add .btn-close").click(function () {
        $("input:radio[value='0']").trigger("click");
        closeModal();
    });

});

function closeModal() {
    $menuName.parent().prev().text("菜单名称：");
    $("#menu-add-modal-title").html('新增菜单/按钮');
    $("#menu-add-button").attr("name", "save");
    $menuUrlListRow.show();
    $menuIconListRow.show();
    validator.resetForm();
    $MB.closeAndRestModal("menu-add");
    $MB.refreshJsTree("menuTree", createMenuTree());

}


/**
 * 验证菜单是否重复
 */
function validateRule() {
    var icon = "<i class='zmdi zmdi-close-circle zmdi-hc-fw'></i> ";
    validator = $menuAddForm.validate({
        rules: {
            menuName: {
                required: true,
                minlength: 2,
                maxlength: 10,
                remote: {
                    url: "menu/checkMenuName",
                    type: "get",
                    dataType: "json",
                    data: {
                        menuName: function () {
                            return $("input[name='menuName']").val().trim();
                        },
                        type: function () {
                            return $("input[name='type']").val();
                        }
                    }
                }
            }
        },
        messages: {
            menuName: {
                required: icon + "请输入名称",
                minlength: icon + "名称长度2到10个字符",
                remote: icon + "该名称已经存在"
            }
        }
    });
}


/**
 * 显示菜单树
 */
function createMenuTree() {
    $.get("menu/tree", {}, function (r) {
        if (r.code === 200) {
            var data = r.data;
            $('#menuTree').jstree({
                "core": {
                    'data': data.children,
                    'multiple': false
                },
                "state": {
                    "disabled": true
                },
                "checkbox": {
                    "three_state": false
                },
                "plugins": ["wholerow", "checkbox"]
            });
        } else {
            $MB.n_danger(r.message);
        }
    })

}

/**
 * 菜单父id
 */
function getMenu() {
    var ref = $('#menuTree').jstree(true);
    $("[name='parentId']").val(ref.get_checked()[0]);
}