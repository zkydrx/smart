<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/common.jsp">
    <jsp:param name="title" value="用户"/>
</jsp:include>

<link rel="stylesheet" href="${_staticPath}/custom/zTree/css/metroStyle/metroStyle.css?v=1"/>
<link rel="stylesheet" href="${_staticPath}/custom/zTree/css/metroStyle/metroStyle.custom.css"/>

<div class="row">
    <div class="col-xs-12 col-sm-3">
        <ul id="_tree" class="ztree" style="width:560px; overflow:auto;"></ul>
    </div>
    <div class="col-xs-12 col-sm-9">
        <div class="widget-box">
            <div class="widget-header widget-header-small">
                <h5 class="widget-title lighter">搜索栏</h5>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <form id="_form" class="form-inline">
                        <input id="_officeId" type="hidden" name="officeId" value="">
                        <label>
                            <label class="control-label" for="form-field-1"> 登录名： </label>
                            <input name="account" type="text" class="form-data input-medium search-data">
                        </label>
                        <label>
                            <label class="control-label" for="form-field-1"> 姓名： </label>
                            <input name="name" type="text" class="form-data input-medium search-data">
                        </label>
                    </form>
                </div>
            </div>
        </div>

        <div>
            <div class="dataTables_wrapper form-inline no-footer">
                <table id="_table" class="table table-striped table-bordered table-hover dataTable no-footer">
                </table>
            </div>
        </div>
    </div>
</div>

<!-- page specific plugin scripts -->
<script type="text/javascript">

    scripts.push(
        "${_staticPath}/custom/zTree/js/jquery.ztree.core-3.5.min.js",
        "${_staticPath}/custom/zTree/js/jquery.ztree.excheck-3.5.min.js");

    $('.page-content-area').ace_ajax('loadScripts', scripts, function () {
        jQuery(function ($) {
            // 列表
            var $table = $("#_table").table({
                url: "${_path}/admin/user/list",
                formId: "_form",
                tools: [
                    {
                        text: '新增',
                        clazz: 'btn-info',
                        icon: 'fa fa-plus-circle blue',
                        permission: '/admin/user/edit',
                        handler: function () {
                            $.aceRedirect("${_path}/admin/user/edit");
                        }
                    },
                    {
                        text: '禁用',
                        clazz: 'btn-warning',
                        icon: 'fa fa-lock orange',
                        permission: '/admin/user/enable',
                        handler: function () {
                            $table.ajaxEnable({url: "${_path}/admin/user/enable"}, false);
                        }
                    },
                    {
                        text: '启用',
                        clazz: 'btn-success',
                        icon: 'fa fa-unlock green',
                        permission: '/admin/user/enable',
                        handler: function () {
                            $table.ajaxEnable({url: "${_path}/admin/user/enable"}, true);
                        }
                    },
                    {
                        text: '删除',
                        clazz: 'btn-danger',
                        icon: 'fa fa-trash-o red',
                        permission: '/admin/user/delete',
                        handler: function () {
                            $table.ajaxDelete({
                                confirm: "删除用户会关联对应的角色、权限，确认要删除?",
                                url: "${_path}/admin/user/delete"
                            });
                        }
                    },
                    {
                        text: '重置密码',
                        clazz: 'btn-default',
                        icon: 'fa fa-key grey',
                        permission: '/admin/user/resetPassword',
                        handler: function () {
                            $table.ajax({
                                url: "${_path}/admin/user/resetPassword",
                                confirm: "确认重置密码?",
                                after: function () {
                                    $table.reload();
                                }
                            });
                        }
                    },
                    {
                        text: '分配角色',
                        clazz: 'btn-default',
                        icon: 'fa fa-cog grey',
                        permission: '/admin/userRole',
                        handler: function () {
                            if ($table.validateSelected(true)) {
                                $.aceRedirect("${_path}/admin/userRole?userId=" + $table.getSelectedItemKeys("id"));
                            }
                        }
                    }
                ],
                columns: [
                    {field: 'id', hide: true},
                    {field: 'isEnable', hide: true},
                    {field: 'name', title: '姓名', align: 'left'},
                    {field: 'account', title: '登录名', align: 'left'},
                    {field: 'lastLoginTime', title: '最后登录时间', mobileHide: true},
                    {
                        field: 'isEnableStr', title: '是否启用', replace: function (d) {
                            if (d.isEnable)
                                return "<span class='label label-sm label-success'>" + d.isEnableStr + "</span>";
                            else
                                return "<span class='label label-sm label-warning'>" + d.isEnableStr + "</span>";
                        }
                    }
                ],
                operate: [
                    {
                        text: '修改',
                        clazz: 'blue',
                        icon: 'fa fa-pencil',
                        permission: '/admin/user/edit',
                        handler: function (d, i) {
                            $.aceRedirect("${_path}/admin/user/edit?id=" + d.id);
                        }
                    },
                    {
                        text: '禁用', clazz: 'orange', icon: 'fa fa-lock', permission: '/admin/user/enable',
                        handler: function () {
                            $table.ajaxEnable({url: "${_path}/admin/user/enable"}, false);
                        },
                        show: function (d) {
                            return d.isEnable;
                        }
                    },
                    {
                        text: '启用', clazz: 'green', icon: 'fa fa-unlock', permission: '/admin/user/enable',
                        handler: function () {
                            $table.ajaxEnable({url: "${_path}/admin/user/enable"}, true);
                        },
                        show: function (d) {
                            return !d.isEnable;
                        }
                    },
                    {
                        text: '删除',
                        clazz: 'red',
                        icon: 'fa fa-trash-o',
                        permission: '/admin/user/delete',
                        handler: function (d, i) {
                            $table.ajaxDelete({
                                confirm: "删除用户会关联对应的角色、权限，确认要删除?",
                                url: "${_path}/admin/user/delete"
                            });
                        }
                    },
                    {
                        text: '重置密码',
                        clazz: 'grey',
                        icon: 'fa fa-key',
                        permission: '/admin/user/resetPassword',
                        handler: function (d, i) {
                            $table.ajax({
                                url: "${_path}/admin/user/resetPassword",
                                confirm: "确认重置密码?",
                                after: function () {
                                    $table.reload();
                                }
                            });
                        }
                    },
                    {
                        text: '分配角色',
                        clazz: 'grey',
                        icon: 'fa fa-cog',
                        permission: '/admin/userRole',
                        handler: function (d, i) {
                            $.aceRedirect("${_path}/admin/userRole?userId=" + d.id);
                        }
                    }
                ],
                after: function () {
                    // 权限处理
                    $.permission();
                }
            });

            //搜索
            $(".search-data").keyup(function () {
                $table.search();
            });

            // 取消
            $("#_cancel").click(function () {
                $table.search();
            });

            var setting = {
                view: {
                    selectedMulti: true
                },
                async: {
                    enable: true,
                    contentType: "application/x-www-form-urlencoded",
                    type: "get",
                    dataType: "text",
                    url: "${_path}/admin/user/office/tree"
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onAsyncSuccess: zTreeOnAsyncSuccess,
                    onClick: zTreeOnClick
                }
            };

            //树加载成功后，全部展开
            function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
                treeObj.expandAll(true);
            };

            function zTreeOnClick(event, treeId, treeNode) {
                if (treeNode.id == undefined || treeNode.id == null) {
                    $("#_officeId").val('');
                } else {
                    $("#_officeId").val(treeNode.id);
                }
                $table.search();
            }

            var treeObj = $.fn.zTree.init($("#_tree"), setting);
        });
    });
</script>
