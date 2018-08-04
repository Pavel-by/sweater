<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>

<@c.page>
<p class="mb-3">Add new user</p>
<#if message??>
    <div class="alert alert-danger" role="alert">
        ${message}
    </div>
</#if>
<@l.login "/registration" true></@l.login>
</@c.page>