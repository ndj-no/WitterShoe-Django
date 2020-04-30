function quantity_change(clicked_id) {
    const shoe_id = clicked_id.split("_")[1];
    const unitprice = to_number(document.getElementById("unitprice_" + shoe_id).innerText);
    const qt = document.getElementById("qt_" + shoe_id).value;
    var checkBox = document.getElementById("checkbox_" + shoe_id);
    if (qt < 1)
        document.getElementById("qt_" + shoe_id).value = 1;
    else {
        // set gia cho san pham dc thay doi gia tri
        const totalprice = unitprice * qt;
        old_price = to_number(document.getElementById("totalprice_" + shoe_id).innerText);
        new_price = totalprice;
        document.getElementById("totalprice_" + shoe_id).innerText = to_price_format(totalprice);

        // neu mua thi se tinh vao total products price
        if (checkBox.checked === true) {

            var total_products_price = to_number(document.getElementById("total_products_price").innerText);
            total_products_price = total_products_price + (new_price - old_price);
            document.getElementById("total_products_price").innerText
                = to_price_format(total_products_price);
            fix_total_discount();
            const total_discount = to_number(document.getElementById("total_discount").innerText);
            document.getElementById("final_price").innerText
                = to_price_format(total_products_price - total_discount);
        }
    }
}

function fix_total_discount() {
    var rate;
    if (document.getElementById("discount_rate") !== null)
        rate = to_number(document.getElementById("discount_rate").innerText);
    else
        rate = 0;
    var amount;
    if (document.getElementById("discount_amount") !== null)
        amount = to_number(document.getElementById("discount_amount").innerText);
    else
        amount = 0;

    const total_products_price = to_number(document.getElementById("total_products_price").innerText);
    const total_discount = amount + (total_products_price - amount) * rate / 100;
    document.getElementById("total_discount").innerText = to_price_format(total_discount);
}

function to_number(x) {
    var out = String(x).replace(".", "").replace(",", "");
    var i;
    for (i = 0; i < 10; i++)
        out = out.replace(".", "").replace(",", "");
    return Number(out);
}

function to_price_format(x) {
    out = x.toLocaleString();
    var i;
    for (i = 0; i < 10; i++)
        out = out.replace(",", ".");
    return out;
}

function check_the_box(clicked_id) {
    const shoe_id = clicked_id.split("_")[1];
    const unitprice = to_number(document.getElementById("unitprice_" + shoe_id).innerText);
    const qt = document.getElementById("qt_" + shoe_id).value;
    var checkBox = document.getElementById("checkbox_" + shoe_id);

    const totalprice = unitprice * qt;

    var total_products_price = to_number(document.getElementById("total_products_price").innerText);

    if (checkBox.checked === true) {
        total_products_price = total_products_price + totalprice;

        document.getElementById("total_products_price").innerText
            = to_price_format(total_products_price);

        fix_total_discount();
        const total_discount = to_number(document.getElementById("total_discount").innerText);
        document.getElementById("final_price").innerText
            = to_price_format(total_products_price - total_discount);

    } else {
        total_products_price = total_products_price - totalprice;

        document.getElementById("total_products_price").innerText
            = to_price_format(total_products_price);

        fix_total_discount();
        const total_discount = to_number(document.getElementById("total_discount").innerText);
        document.getElementById("final_price").innerText
            = to_price_format(total_products_price - total_discount);

    }

}
