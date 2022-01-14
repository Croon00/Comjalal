
function delete_cart(cart_idx) {

	location.href = 'product_cart_delete?cart_idx=' + cart_idx
}

function plus_cart(cart_idx) {

	var product_amount = $("#p_num_" + cart_idx).val()

	var product_price = $("#product_price_" + cart_idx).val()

	var money = $("#money_" + cart_idx).text()

	product_amount = parseInt(product_amount) + 1

	$("#p_num_" + cart_idx).val(product_amount)


	money = parseInt(money) + parseInt(product_price)

	$('#money_' + cart_idx).text(money)




}

function minus_cart(cart_idx) {

	var product_amount = $("#p_num_" + cart_idx).val()

	var money = $("#money_" + cart_idx).text()

	var product_price = $("#product_price_" + cart_idx).val()

	product_amount = parseInt(product_amount) - 1
	if (product_amount > 0) {

		money = parseInt(money) - parseInt(product_price)
	}

	if (product_amount < 1) {
		product_amount = 1
	}


	$("#p_num_" + cart_idx).val(product_amount)

	$('#money_' + cart_idx).text(money)

}

$(document).ready(function() {
	$('#allCheck').click(function() {

		if ($('#allCheck').prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		}
		else {
			$("input[type=checkbox]").prop("checked", false);
		}
		
		itemSum()
		
	})
	
	
})

function checkForm() {
	var opnum = new Array();
	var a1 = []
	var b1 = []
	$("input[name='opnum']:checked").each(function() {
	
		opnum.push(this.value);
	
		a1.push($("#p_num_" + this.value).val())
		b1.push($("#cart_product_idx" + this.value).val())
		
	});



	for (var i = 0; i < opnum.length; i++) {
		$.ajax({
			url: 'product_order_pro',
			type: 'post',
			async:false,
			data: {
				buytemp_num: opnum[i],
				buytemp_amount: a1[i],
				buytemp_product_idx: b1[i]

			},
			success : function() {
				
				if(i == opnum.length - 1){
					location.href = "product_order"
				}
			}
		});
	}
	
	return false
}



function itemSum() {
	var sum = 0;

	$("input[name='opnum']:checked").each(function() {
		
		b1 = $("#money_" + this.value).text()

		sum = sum + parseInt(b1)
		
	});
	$('#cart_sum').text(sum)
	$('#cart_allsum').text(sum)

}




