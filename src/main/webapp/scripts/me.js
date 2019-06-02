$(function () {
    //display task form
    $("#btnAddTask").click(function displayForm() {
        $("#newTask").css("display", "block");
    });


    //Validate Form
    $("#saveTask").click(function (evt) {

        evt.preventDefault();
        $(".error").empty();
        var submitFlag = true;

        if ($("#task").val() === "") {
            $(".error").append("You must fill in the task field<br>");
            submitFlag = false;
        }

        if ($("#requiredby").val() === "") {
            $(".error").append("You must inform a due date<br>");
            submitFlag = false;
        }

        if ($("#category").val() === "") {
            $(".error").append("Select one category<br>");
            submitFlag = false;
        }

        if ($("#priority").val() === "") {
            $(".error").append("Select one priority<br>");
            submitFlag = false;
        }

        if (submitFlag)
            this.submit();

    });

    //Clear form fields
    $("#clearTask").click(function (evt) {

        evt.preventDefault();
        $("#task").val("");
        $("#requiredby").val("");
        $("#category").val("Personal");
    });

    //highlight the overdue task
    $("#tblTasks .task-row").each(function () {

        var dueDateStr = $(this).find(".duedate").html();
        var dueDate = new Date(dueDateStr);
        if(dueDate.getTime() < new Date().getTime()) {
            $(this).css("background-color", "#F17060");
        }
    });

    $(".doneTask").each(function () {
        var button = $(this);
        $(this).click(function (evt) {
            evt.preventDefault();

            var taskId = $(this).attr("href").match(/done=([^&]+)/)[1];
            //
            // $(this).parents("tr").remove();

            $.ajax("/task/" + taskId + "/done", { "type": "POST", "id": taskId})
                .done(function () {
                    $(this).parents("tr").remove();
                })
                .fail(function () {
                    alert("It was not possible to mark the task as completed. Try again.")
                });
        });
    });
});