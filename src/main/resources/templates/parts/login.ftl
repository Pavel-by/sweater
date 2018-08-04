<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group">
        <label>Username</label>
        <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}"
               placeholder="Enter username" name="username"
               value="<#if user??>${user.username}</#if>">
        <#if usernameError??>
            <div class="invalid-feedback">
                ${usernameError}
            </div>
        </#if>
    </div>
    <div class="form-group">
        <label>Password</label>
        <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
               placeholder="password" name="password">
        <#if passwordError??>
            <div class="invalid-feedback">
                ${passwordError}
            </div>
        </#if>
    </div>
    <#if isRegisterForm>
        <div class="form-group">
            <label>Repeat password</label>
            <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                   placeholder="password" name="password2">
            <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
            </#if>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                   placeholder="Email" name="email"
                   value="<#if user??>${user.email}</#if>">
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
        </div>
        <div class="pb-3 pt-3">
            <div class="g-recaptcha" data-sitekey="6Lcqz2YUAAAAAMwMnV_msm7GeYvX2X5VoRjLzx1o"></div>
            <#if captchaError??>
                <div class="alert alert-danger pt-3" role="alert">
                    ${captchaError}
                </div>
            </#if>
        </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="btn btn-primary">Submit</button>
    <#if !isRegisterForm><a href="/registration" class="ml-3">Registration</a><#else ><a href="/login" class="ml-3">Authorization</a></#if>
</form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <button type="submit" class="btn btn-primary">Sign Out</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>
</#macro>