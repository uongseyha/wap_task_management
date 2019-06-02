<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> Sample Lat Lng</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even){background-color: #f2f2f2}

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<input type="button" id="btn" value="Display sample lat lng" />
<div id="mytable">

</div>
</body>

<script>
    $(document).ready(function () {
        $('#btn').click(function() {
            $.ajax({
                "url": "samplejson.json",
                "type": "GET",
                "dataType": "json",
                "success": myAjaxSuccessFunction,
                "error": ajaxFailure
            });
        });

        function myAjaxSuccessFunction(data) {
            $('#mytable').empty();
            $('#mytable').append('<table style="border: 1px solid black">');
            $('#mytable').append('<tr> <th> No </th> <th>City</th> <th>Lat</th> <th> Lng </th> </tr>');

            for(var i=0; i<data.length; i++){
                $('#mytable').append('<tr> <td> '+ parseInt(i+1) +' </td> <td> ' + data[i].city + ' </td> <td> ' + data[i].lat + ' </td> <td> ' + data[i].lng + ' </td>  </tr>');
            }

            $('#mytable').append('</table>');
        }

        function ajaxFailure(xhr, status, exception) {
            console.log(xhr, status, exception);
        }
    });
</script>

</html>

