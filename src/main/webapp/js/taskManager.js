$(function () {
    //Validate Task Form
    console.log("log");
    $("#saveTask").click(function (evt) {

        evt.preventDefault();
        $(".error").empty();
        var submitFlag = true;

        if ($("#title").val() === "") {
            $(".error").append("You must fill in the task field<br>");
            submitFlag = false;
        }

        if ($("#dueDate").val() === "") {
            $(".error").append("You must inform a due date<br>");
            submitFlag = false;
        }

        if ($("input[name=priority]:checked").val() === undefined) {
            $(".error").append("Select one category<br>");
            submitFlag = false;
        }

        if ($("input[name=category]:checked").val() === undefined) {
            $(".error").append("Select one priority<br>");
            submitFlag = false;
        }


        console.log();
        if ($("input[name=category]:checked").val() === "PERSONAL") {
            if ($("#developer").val() === "") {
                $(".error").append("You must select one developer from the list<br>");
                submitFlag = false;
            }
        } else if ($("input[name=category]:checked").val() === "TEAM") {
            if ($("#team").val() === "") {
                console.log(3);
                $(".error").append("You must select one team from the list<br>");
                submitFlag = false;
            }
        }

        if (submitFlag) {
            $("#taskForm").submit();
        }

    });

    //Change fields according to the category selected
    $("input[name=category]").change(function () {
        if ($(this).val() === "PERSONAL") {
            $("#teamLabel").hide();
            $("#team").hide();
        } else if ($(this).val() === "TEAM") {
            $("#teamLabel").show();
            $("#team").show();
        }
    });

    // Clear form fields
    $("#clearTask").click(function (evt) {

        evt.preventDefault();
        $("#title").val("");
        $("#dueDate").val("");
        $("input[name=priority]").attr('checked', false);
        $("input[name=category]").attr('checked', false);
        $("#developer").val("");
        $("#team").val("");
        $("#finishDate").val("");
        $("input[name=rate]").attr('checked', false);

    });

});