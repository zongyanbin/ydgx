<div class="tncode" style="text-align: center;margin: 20px auto; background-color: #ffffff;"></div>
<input type="hidden" id="id_code_val" value="";>
<script type="text/javascript">
    $TN.onsuccess(function(){
        document.getElementById("code_reg").style.display="inline";
        $("id_code_val")
        document.getElementById("id_code_val").value="1";
        $(".tncode").addClass('disabled_code');
    });
</script>
