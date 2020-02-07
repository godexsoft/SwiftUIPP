#pragma once
#include <Foundation/Foundation.h>

template<typename Signature> class objc_callback;

template<typename R, typename... Ts>
class objc_callback<R(Ts...)>
{
public:
    typedef R (*func)(id, SEL, Ts...);
    
    objc_callback(SEL sel, id obj)
    : sel_(sel)
    , obj_(obj)
    , fun_((func)[obj methodForSelector:sel])
    {
    }
    
    inline R operator ()(Ts... vs)
    {
        return fun_(obj_, sel_, vs...);
    }
private:
    SEL sel_;
    id obj_;
    func fun_;
};

template<typename Signature> class objc_block;

template<typename R, typename... Ts>
class objc_block<R(Ts...)>
{
public:
    typedef R (^block)(Ts...);
        
    objc_block(block b)
    : blk_{b}
    {
    }
    
    inline R operator ()(Ts... vs)
    {
        return blk_(vs...);
    }
private:
    block blk_; // FIXME: i have no idea about lifetime of blocks
};
