
----------------------------------------------------------------------------
-- $Id: md5.lua,v 1.5 xx 19:24:21 carregal Exp $
-- 定义了一些关于文件的操作，如建立目录，保存文件等等，主要集中在lfs中。
-- 定义了初始的文件搜索路径，包括安装包中创建的路径和可读写路径，后者主要是热更新文件的存放路径。
----------------------------------------------------------------------------
require("lfs")
local core = require"md5.core"

----------------------------------------------------------------------------
-- @param k String with original message.
-- @return String with the md5 hash value converted to hexadecimal digits
function md5.sumhexa (k)
    k = core.sum(k)
    return (string.gsub(k, ".", function (c)
        return string.format("%02x", string.byte(c))
    end))
end

-- 创建一个文件
function lfs.mktreedir(path)
    local attr = lfs.attributes(path);
    if attr and attr.mode == 'directory'  then
        return true;
    end

    local dirname = lfs.dirname(path);
    if lfs.mktreedir(dirname) then
        return lfs.mkdir(path);
    end
end


-- 删除一个文件目录
function lfs.remove(path)
    local attr = lfs.attributes(path)
    if type(attr) == "table" and attr.mode == "directory" then
        local dirPath = path.."/"
        for file in lfs.dir(dirPath) do
            if file ~= "." and file ~= ".." then 
                local f = dirPath..file 
                lfs.remove(f)
            end 
        end
        os.remove(path)
    else
        os.remove(path)
    end
end

--获得一个根目录路径，递归该路径下的所有子目录，返回所有文件全路径
function lfs.getPaths(rootpath,paths)
    paths = paths or {};
    if lfs.attributes(rootpath) then
        for entry in lfs.dir(rootpath) do
            if entry ~= '.' and entry ~= '..' then
                local path = rootpath .. '/' .. entry;
                local attr = lfs.attributes(path)
                assert(type(attr) == 'table');
                if attr.mode == 'directory' then
                    lfs.getPaths(path, paths)
                else
                    table.insert(paths, path)
                end
            end
        end
    end
    return paths;
end

--获得该路径后的路径(文件子目录)
function lfs.getBackPaths(rootpath)
    local paths = lfs.getPaths(rootpath)
    for i = 1, #paths do
        paths[i] = string.gsub(paths[i], rootpath, "");
        print(string.format("paths[%d] = ", i),paths[i])
    end
    return paths;
end

-- 提取一个文件的所在目录
function lfs.dirname(dirname)
    local pos = string.len(dirname)
    while pos > 0 do
        local b = string.byte(dirname, pos)
        pos = pos - 1
        if b == 47 then -- 47 = char "/"
            break
        end
    end
    return string.sub(dirname, 1, pos)
end

-- 获取文件信息 目录 （文件名＋后缀名）  后缀名 文件名
function lfs.getFileInfo(path)
	local pos = string.len(path)
    local extpos = pos + 1
    while pos > 0 do
        local b = string.byte(path, pos)
        if b == 46 then -- 46 = char "."
            extpos = pos
        elseif b == 47 then -- 47 = char "/"
            break
        end
        pos = pos - 1
    end

    local dirname = string.sub(path, 1, pos)-- 文件目录
    local filename = string.sub(path, pos + 1)-- 文件名
    extpos = extpos - pos
    local basename = string.sub(filename, 1, extpos - 1)
    local extname = string.sub(filename, extpos)
    return {
        dirname = dirname,-- 文件目录
        filename = filename,--文件全名称（文件名＋后缀）
        basename = basename,--文件名称
        extname = extname--文件后缀名
    }
end

-- 获取文件信息
function lfs.readfileContent(path)
    local file = io.open(path, "r")
    if file then
        local content = file:read("*a")
        io.close(file)
        return content
    end
    return nil
end

-- 写入文件
function lfs.writeFile(path, data, mode)
    local pRet = false;
    if lfs.mktreedir(lfs.dirname(path)) then
        mode = mode or "w+b"
        local file = io.open(path, mode)
        if file then
            if file:write(data) == nil then return false end
            io.close(file)
            pRet = true
        else
            pRet = false
        end
    end
    assert(pRet == true, path .. "文件写入失败")
    return pRet;
end
