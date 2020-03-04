$(function () {
    var settings = {
        url: ctx + "session/list",
        pageSize: 100,
        columns: [{
            field: 'username',
            title: '用户名'
        }, {
            field: 'startTimestamp',
            title: '登录时间'
        }, {
            field: 'lastAccessTime',
            title: '最后访问时间'
        }, {
            field: 'host',
            title: 'IP地址'
        }, {
            field: 'location',
            title: '登录地点'
        }, {
            field: 'status',
            title: '状态',
            formatter: function (value, row, index) {
                if (value === '1') return '<span class="badge badge-success">在线</span>';
                if (value === '0') return '<span class="badge badge-danger">离线</span>';
            }
        }, {
            title: '操作',
            formatter: function (value, row, index) {
                return "<a href='#' onclick='offline(\"" + row.id + "\",\"" + row.status + "\",\"" + row.username + "\")'>下线</a>";
            }
        }]
    };

    $MB.initTable('onlineTable', settings);
});

/**
 * 下线
 * @param id sessionId
 * @param status 状态
 * @param username 用户
 */
function offline(id, status, username) {
    if (status === "0") {
        $MB.n_warning("该用户已是离线状态！！");
        return;
    }
    if (username === userName) {
        location.href = ctx + 'logout';
    }
    $.get(ctx + "session/forceLogout", {"sessionId": id}, function (r) {
        if (r.code === 0) {
            $MB.n_success('该用户已强制下线！');
            $MB.refreshTable('onlineTable');
        } else {
            $MB.n_danger(r.message);
        }
    }, "json");
}