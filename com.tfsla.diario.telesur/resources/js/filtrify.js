@font-face {
    font-family: "FiltrifyRegular";
    font-style: normal;
    font-weight: normal;
    src: url("../font/filtrify/filtrify-webfont.eot?#iefix") format("embedded-opentype"), url("../font/filtrify/filtrify-webfont.woff") format("woff"), url("../font/filtrify/filtrify-webfont.ttf") format("truetype"), url("../font/filtrify/filtrify-webfont.svg#FiltrifyRegular") format("svg");
}
.ft-hidden, .ft-no-items-hidden { display: none !important; }
ul.ft-menu, ul.ft-menu * {
    border: 0 none;
    font: 100% sans-serif;
    margin: 0;
    padding: 0;
    position: relative;
    text-align: left;
    margin-top: 1%;
}
ul.ft-menu {
    list-style: none outside none;
}
ul.ft-menu > li.ft-field {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0) !important;
    color: #2d3743;
    font-size: 11px;
    margin-right: 75%;
    margin-top: 2%;
    position: relative !important;
}
ul.ft-menu > li.ft-field > span.ft-label {
    cursor: pointer;
}
ul.ft-menu > li.ft-field > span.ft-label:before {
    content: "t";
    display: inline-block;
    font-family: "FiltrifyRegular";
    width: 20px;
}
ul.ft-menu > li.ft-field > span.ft-label:after {
    content: " ▼";
    font-size: 80%;
}
ul.ft-menu > li.ft-field > span.ft-label.ft-active:before {
    color: #2d3743;
    content: "T";
}
ul.ft-menu > li.ft-field > span.ft-label.ft-opened:after {
    content: " ▲";
}
ul.ft-menu > li.ft-field > div.ft-panel {
    background-clip: padding-box;

}
ul.ft-menu > li.ft-field > div.ft-panel:before, ul.ft-menu > li.ft-field > div.ft-panel:after {

}
ul.ft-menu > li.ft-field > div.ft-panel:before {
    border-bottom: 10px solid rgba(0, 0, 0, 0.3);
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    margin-left: -10px;
    top: -15px;
}
ul.ft-menu > li.ft-field > div.ft-panel:after {
   
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-selected {
    /*background: none repeat scroll 0 0 #f5f3ee;*/
    padding: 10px 10px 0;
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-selected > li {
    background: linear-gradient(#33bcef, #019ad2) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border: 1px solid rgba(5, 126, 208, 0.698);
    border-radius: 3px;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1) inset;
    color: white;
    cursor: pointer;
    display: inline-block;
    font-size: 10px;
    margin: 1px;
    padding: 0 5px 1px;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-selected > li:after {
    color: white;
    content: " ×";
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-selected > li:active {
    background: linear-gradient(#019ad2, #33bcef) repeat scroll 0 0 rgba(0, 0, 0, 0);
}
ul.ft-menu > li.ft-field > div.ft-panel > fieldset.ft-search {
   
    padding: 10px;
}
ul.ft-menu > li.ft-field > div.ft-panel > fieldset.ft-search:before {
    bottom: 10px;
    color: #bbb;
    /*content: "s";*/
    font: 12px "FiltrifyRegular";
    left: 18px;
    position: absolute;
    text-shadow: none;
    width: 20px;
    z-index: 1;
}
ul.ft-menu > li.ft-field > div.ft-panel > fieldset.ft-search > input {
    background: none repeat scroll 0 0 white;
    border-radius: 13px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.4) inset, 0 1px 0 rgba(0, 0, 0, 0.3) inset;
    color: gray;
    display: none;
    outline: medium none;
    padding: 4px 10px 4px 25px;
    width: 100px;
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-tags {
    border-top: 1px solid #33373d;
    max-height: 200px !important;
    overflow-x: hidden;
    overflow-y: auto;
    position: relative !important;
    width: 100%;
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-tags > li {
    background: linear-gradient(#f5f5f5, #f5f5f5) repeat scroll 0 0 rgba(0, 0, 0, 0);
    color: black;
    cursor: pointer;
    display: block;
    font-size: 9px;
    padding: 8px 35px 8px 15px;
    /*text-shadow: 0 1px 0 rgba(0, 0, 0, 0.5);*/
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-tags > li:after {
    background: none repeat scroll 0 0 #48515c;
    border-radius: 8px;
    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.26) inset, 0 1px 0 0 rgba(255, 255, 255, 0.15);
    color: white;
    content: attr(data-count);
    display: inline-block;
    font-size: 8px;
    font-weight: normal;
    margin-top: -9px;
    padding: 3px 6px;
    position: absolute;
    right: 15px;
    top: 50%;
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-tags > li.ft-highlight {
    border-bottom: 1px solid #103c56;
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-tags > li.ft-highlight:active {
    background: none repeat scroll 0 0 #dfdfdf;
}
ul.ft-menu > li.ft-field > div.ft-panel > ul.ft-tags > li.ft-highlight:after {
    background: none repeat scroll 0 0 #2173a1;
}
ul.ft-menu > li.ft-field > div.ft-panel > div.ft-mismatch {
    background: linear-gradient(#555555, #333333) repeat scroll 0 0 rgba(0, 0, 0, 0);
    color: white;
    font-size: 9px;
    padding: 10px 15px;
}
.ft-hidden {
    display: none !important;
}