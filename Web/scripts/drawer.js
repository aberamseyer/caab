/**
 * Created by Commander Data on 11/10/2017.
 */
function openNav() {
    document.getElementById("drawer").style.width = "235px";
    document.getElementById("tableContent").style.marginLeft = "235px";
}

function closeNav() {
    document.getElementById("drawer").style.width = "0";
    document.getElementById("tableContent").style.marginLeft= "0";
}