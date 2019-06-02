$(function () {
    $("#saveTeam").click(function (evt) {
        
        evt.preventDefault();
        $("#error").empty();
        var submitFlag = true;
        
        if ($("#teamName").val() === "" ) {
            console.log("inside");
            $("#error").append("You must provide a team name.<br>");
            submitFlag = false;
        }

        console.log(getUrlParameter("action"));
        if (getUrlParameter("action") !== "update") {
            if ($("input[name=developer]:checked").val() === undefined) {
                $("#error").append("You must select at least one team member.<br>");
                submitFlag = false;
            }
        }

        if (submitFlag)
            $("#teamForm").submit();
    });


    function getUrlParameter(sParam) {
        var sPageURL = window.location.search.substring(1),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
            }
        }
    }


});