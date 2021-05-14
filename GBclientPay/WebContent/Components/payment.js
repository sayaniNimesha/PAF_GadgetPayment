$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});

//implement save button
$(document).on("click", "#btnSave", function(event)
		{
	// Clear alerts---------------------
		$("#alertSuccess").text("");
		$("#alertSuccess").hide();
		$("#alertError").text("");
		$("#alertError").hide();
		
		
		// Form validation-------------------
		var status = validateItemForm();
		if (status != true)
		{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
		}
		
		// If valid-------------------------
		var type = ($("#hidPayIDSave").val() == "") ? "POST" : "PUT";
		
		$.ajax(
		{
			url : "PaymentAPI",
			type : type,
			data : $("#formItem").serialize(),
			dataType : "text",
			complete : function(response, status)
			{
				onPaySaveComplete(response.responseText, status);
			}
		});
	});	

function onPaySaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divPayGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidItemIDSave").val("");
	$("#formItem")[0].reset();
}

$(document).on("click", ".btnRemove", function(event)
		{
			$.ajax(
		{
		url : "PaymentAPI",
		type : "DELETE",
		data : "pyId=" + $(this).data("pyid"),
		dataType : "text",
		complete : function(response, status)
		{
			onPaymentDeleteComplete(response.responseText, status);
		}
	});
});

function onPaymentDeleteComplete(response, status)
{
	if (status == "success")
	{
	var resultSet = JSON.parse(response);
	if (resultSet.status.trim() == "success")
	{
		$("#alertSuccess").text("Successfully deleted.");
		$("#alertSuccess").show();
		$("#divPayGrid").html(resultSet.data);
	} else if (resultSet.status.trim() == "error")
	{
		$("#alertError").text(resultSet.data);
		$("#alertError").show();
	}
	} else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

$(document).on("click", ".btnUpdate", function(event)
		{
			
			$("#hidPayIDSave").val($(this).data("pyid"));
			$("#pyDes").val($(this).closest("tr").find('td:eq(1)').text());
			$("#pyDate").val($(this).closest("tr").find('td:eq(2)').text());
			$("#amount").val($(this).closest("tr").find('td:eq(3)').text());
								
});

//CLIENT-MODEL================================================================
function validateItemForm()
{
	// CODE
	if ($("#pyDes").val().trim() == "")
	{
		return "Insert pyDes.";
	}
	
	// NAME
	if ($("#pyDate").val().trim() == "")
	{
		return "Insert Date.";
	}
	
	// PRICE-------------------------------
	if ($("#amount").val().trim() == "")
	{
		return "Insert  Price.";
	}
	
	// is numerical value
	var tmpPrice = $("#amount").val().trim();
	if (!$.isNumeric(tmpPrice))
	{
		return "Insert a numerical value for Price.";
	}
	
	// convert to decimal price
	$("#amount").val(parseFloat(tmpPrice).toFixed(2));
	

	
	return true;
}
