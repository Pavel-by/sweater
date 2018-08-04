<#import "parts/common.ftl" as c>

<@c.page>
    <h5>${username}</h5>
    ${message?if_exists}
    <form method="post">
        <div class="form-group">
            <label>Password</label>
            <input type="password" class="form-control" placeholder="password" name="password" autocomplete="false">
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" class="form-control" placeholder="Email" name="email" value="${email!''}" autocomplete="false">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</@c.page>