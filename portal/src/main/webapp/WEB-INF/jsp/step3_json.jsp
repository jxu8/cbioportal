<%@ page import="org.mskcc.cbio.portal.servlet.QueryBuilder" %>
<%
    String step3ErrorMsg = (String) request.getAttribute(QueryBuilder.STEP3_ERROR_MSG);
%>

<div class="query_step_section" id="step3">
	<table>
		<tr>
			<td>
    		<span class="step_header">Select Patient/Case Set:</span>
			</td>
			<td>
				<select id="select_case_set" name="<%= QueryBuilder.CASE_SET_ID %>"></select>
	 		</td>
	 		<td>
	 			<a id="build_custom_case_set" onclick="promptCustomCaseSetBuilder()" title="Build a Custom Case Set Based on Clinical Attributes">
	 				Build Case Set
	 			</a>
	 		</td>
		</tr>
		<tr>
			<td></td>
			<td><span style="font-size:95%; color:black">(Tip:  Hover your mouse over a case set to view a description.)</span>
			</td>
		</tr>
	</table>
	
	<div id="custom_case_set_dialog" title="Build a Case Set">
		<table id="case_set_dialog_header">
			<tr>
				<td id="selected_cancer_study_title" align="left">Build a Custom Case Set for: </td>
				<td id="number_of_cases_title" align="right">Number of Matching Cases: </td>
			</tr>
			<tr>
				<td id="selected_cancer_study" align="left"></td>
				<td id="number_of_cases" align="right"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td class="custom_case_set_warning" align="right"></td>
			</tr>
		</table>
		<table id="case_set_dialog_content"></table>
		<table id="case_set_dialog_footer">			
   			<tr>
   				<td>
					<button id="cancel_custom_case_set" title="Cancel">Cancel</button>
				</td>
				<td>
					<button id="submit_custom_case_set" class="tabs-button" title="Use this case set">Build</button>
				</td>
			</tr>
		</table>
	</div>
    <div id="mutsig_dialog" title="Recurrently Mutated Genes" style="font-size: 11px; .ui-dialog {padding: 0em;};">
        <img id='loader-img' src="images/ajax-loader.gif"/>
        <table class="MutSig">
            <thead>
                <tr>
                    <th>Gene Symbol</th>
                    <th>Num Mutations</th>
                    <th>Q-Value</th>
                    <th><input class="checkall" type="checkbox"></td>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
		<div id="mutsig_dialog_footer" style="float: right;">
					<button id="cancel_mutsig" title="Cancel">Cancel</button>
					<button id="select_mutsig" class="tabs-button" title="Use these mutsig genes">Select</button>
		</div>
    </div>

<script type="text/javascript">
google.setOnLoadCallback(function() {
    // set up modal dialog box for gistic table (step 3)
    $('#gistic_dialog').dialog({autoOpen: false,
        resizable: false,
        modal: true,
//        height: 500,
        //minWidth: 636,
        //overflow: 'hidden',
        open: function() {
            // sets the scrollbar to the top of the table
            // todo: downside -- doesn't save scroll location
            $(this).scrollTop(0);
        }
        });

    //var g = gistic();
    //var cancer_study_id = 'tcga_gbm';
    //var model = g.model(cancer_study_id);
    //var controller = g.controller(model);
    //var els = {
    //    gene_list: $('#gene_list'),
    //    open_dialog: $('#toggle_gistic_button'),
    //    dialog: $('#gistic_dialog'),
    //    select: $('#select_gistic'),
    //    cancel: $('#cancel_gistic')

    //};
    //var view = g.view(model, controller, els);
});
</script>

    <div id="gistic_dialog" title="Regions of Interest" style="font-size:11px; white-space:nowrap; text-align:left; .ui-dialog {padding:0em;};">
        <div id="gistic_table"></div>
		<div id="gistic_dialog_footer" style="float: right;">
					<button id="cancel_gistic" onclick="Gistic.UI.cancel_button();"title="Cancel">Cancel</button>
					<button id="select_gistic" onclick="Gistic.UI.select_button();" class="tabs-button" title="Use these ROI genes">Push Selected to Gene Set</button>
		</div>
    </div>
<%
String customCaseListStyle = "none";
// Output step 3 form validation error
if (step3ErrorMsg != null) {
    out.println("<div class='ui-state-error ui-corner-all' style='margin-top:4px; padding:5px;'>"
            + "<span class='ui-icon ui-icon-alert' style='float: left; margin-right: .3em;'></span>"
            + "<strong>" + step3ErrorMsg + "</strong>");
    customCaseListStyle = "block";
}
%>
    <div id='custom_case_list_section' style="display:<%= customCaseListStyle %>;">
        <p><span style="font-size:80%">Enter case IDs below:</span></p>
<textarea id='custom_case_set_ids' name='<%= QueryBuilder.CASE_IDS %>' rows=6 cols=80><%
    if (localCaseIds != null) {
            out.print (localCaseIds.trim());
        }
%></textarea>
    </div>

<%
if (step3ErrorMsg != null) {
    out.println("</div>");
}
%>
</div>
