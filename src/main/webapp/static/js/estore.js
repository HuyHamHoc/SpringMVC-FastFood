$(document).ready(function() {
	
	$("tr[data-id] input").on("input",function(){
		var id = $(this).closest("tr").attr("data-id");
		var price = $(this).closest("tr").attr("data-price");
		var qty = $(this).val();
		$.ajax({
			url: `/cart/update/${id}/${qty}`,
			success: function(response) {

				$("#cart-cnt").html(response[0]);
				$("#cart-amt").html(response[1]);
				

			}
		});
		var amt = qty*price;
		$(this).closest("tr").find("td.amt").html(amt);
	})
	
	
	$(".btn-cart-remove").click(function() {
		var id = $(this).closest("tr").attr("data-id");
		$.ajax({
			url: "/cart/remove/"+id,
			success: function(response) {

				$("#cart-cnt").html(response[0]);
				$("#cart-amt").html(response[1]);
				

			}
		});
		$(this).closest("tr").remove();
	});
	
	$(".btn-cart-clear").click(function() {
		$.ajax({
			url: "/cart/clear",
			success: function(response) {

				$("#cart-cnt").html(0);
				$("#cart-amt").html(0);
				$("table>tbody").html("");

			}
		});
	});

	$(".btn-add-to-cart").click(function() {
		var id = $(this).closest("div").attr("data-id");
		$.ajax({
			url: "/cart/add/" + id,
			success: function(response) {
				$("#cart-cnt").html(response[0]);
				$("#cart-amt").html(response[1]);
			}
		});
	});




	$(".btn-star").click(function() {
		var id = $(this).closest("div").attr("data-id");
		$.ajax({
			url: "/product/add-to-favo/" + id,
			success: function(response) {
				if (response) {
					alert("Đã thêm vào danh sách yêu thích")
				}
				else {
					alert("Đã có trong danh sách yêu thích")
				}
			}
		})
	});
});