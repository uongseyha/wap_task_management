$(function () {
    // highlight the overdue task
    $("#tableData .task-row").each(function () {

        var dueDateStr = $(this).find(".duedate").html();
        var dueDate = new Date(dueDateStr);
        var today = new Date();
        if(dueDate.getTime() < today.getTime() && dueDate.getDate() < today.getDate()) {
            var days = new Date().getDate() - dueDate.getDate();
            $(this).find(".overdue").html("<span class='badge red'>" + days + "</span>");
        }
    });
});