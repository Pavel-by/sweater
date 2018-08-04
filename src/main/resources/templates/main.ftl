<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" placeholder="Search by tag" class="form-control"
                   value="${filter?if_exists}">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Search" class="ml-2 btn btn-primary">
        </form>
    </div>
</div>
<div>
    <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseAdd" role="button" aria-expanded="false"
       aria-controls="collapseAdd">
        Add message
    </a>
</div>
<div id="collapseAdd" class="form-row collapse mb-3 <#if message??>show</#if>">
    <div class="form-group">
        <form method="post" action="/main" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="text" placeholder="Text" value="<#if message??>${message.text}</#if>"
                       class="form-control ${(textError??)?string('is-invalid', '')}">
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" name="tag" placeholder="Tag" class="form-control ${(tagError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.tag}</#if>">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile" name="file">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="form-group">
                <input type="submit" value="Add" class="btn btn-primary">
            </div>
        </form>
    </div>
</div>
<#if errors??>
    <#list errors as error>
        <div>
            <p><b>error.</b></p>
        </div>
    </#list>
</#if>
<div class="card-columns">
    <#list messages as message>
        <div class="card mt-3">
            <#if message.filename??>
                <div>
                    <img class="card-img-top" src="/img/${message.filename}">
                </div>
            </#if>
            <div class="card-body">
                <h5 class="card-title">${message.text}</h5>
                <p class="card-text">${message.tag}</p>
            </div>
            <div class="card-footer text-muted">${message.getAuthorName()}</div>
        </div>
    </#list>
</div>
</@c.page>