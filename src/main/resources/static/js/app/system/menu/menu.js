$(function () {
    initTreeTable();
});


/**
 * 初始化菜单页面
 */
function initTreeTable() {
    var $menuTableForm = $(".menu-table-form");
    var setting = {
        id: 'menuId',
        code: 'menuId',
        url: 'menu/list',
        expandAll: true,
        expandColumn: "2",
        ajaxParams: {
            menuName: $menuTableForm.find("input[name='menuName']").val().trim(),
            type: $menuTableForm.find("select[name='type']").val()
        },
        columns: [
            {
                field: 'selectItem',
                checkbox: true
            },
            {
                title: '编号',
                field: 'menuId',
                width: '50px'
            },
            {
                title: '名称',
                field: 'menuName'
            },

            {
                title: '图标',
                field: 'icon',
                formatter: function (item, index) {
                    return '<i class="zmdi ' + item.icon + '"></i>';
                }

            },
            {
                title: '类型',
                field: 'type',
                formatter: function (item, index) {
                    if (item.type === 'menu') return '<span class="badge badge-success">菜单</span>';
                    if (item.type === 'button') return '<span class="badge badge-warning">按钮</span>';
                }

            },
            {
                title: '地址',
                field: 'url',
                formatter: function (item, index) {
                    return item.url === 'null' ? '' : item.url;
                }
            },
            {
                title: '权限标识',
                field: 'permission',
                formatter: function (item, index) {
                    return item.permission === 'null' ? '' : item.permission;
                }
            },
            {
                title: '创建时间',
                field: 'gmtCreate'
            }
        ]
    };

    $MB.initTreeTable('menuTable', setting);
}

function search() {
    initTreeTable();
}

function refresh() {
    $(".menu-table-form")[0].reset();
    initTreeTable();
    $MB.refreshJsTree("menuTree", createMenuTree());
}

/**
 * 删除菜单
 */
function deleteMenus() {
    var ids = $("#menuTable").bootstrapTreeTable("getSelections");
    var ids_arr = "";
    if (!ids.length) {
        $MB.n_warning("请勾选需要删除的菜单或按钮！");
        return;
    }
    for (var i = 0; i < ids.length; i++) {
        ids_arr += ids[i].id;
        if (i !== (ids.length - 1)) ids_arr += ",";
    }
    $MB.confirm({
        text: "确定删除选中菜单或按钮？",
        confirmButtonText: "确定删除"
    }, function () {
        $.post(ctx + 'menu/delete', {"ids": ids_arr}, function (r) {
            if (r.code === 200) {
                $MB.n_success(r.message);
                refresh();
            } else {
                $MB.n_danger(r.message);
            }
        });
    });
}

function exportMenuExcel() {
    $.post(ctx + "menu/excel", $(".menu-table-form").serialize(), function (r) {
        if (r.code === 0) {
            window.location.href = "common/download?fileName=" + r.msg + "&delete=" + true;
        } else {
            $MB.n_warning(r.msg);
        }
    });
}

function exportMenuCsv() {
    $.post(ctx + "menu/csv", $(".menu-table-form").serialize(), function (r) {
        if (r.code === 0) {
            window.location.href = "common/download?fileName=" + r.msg + "&delete=" + true;
        } else {
            $MB.n_warning(r.msg);
        }
    });
}