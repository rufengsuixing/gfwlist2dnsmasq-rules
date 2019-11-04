#!/bin/sh
awk 'BEGIN{getline;}{
s1=substr($0,1,1);
if (s1=="!")
{next;}
if (s1=="@"){
    $0=substr($0,3);
    s1=substr($0,1,1);
    white=1;}
else{
    white=0;
}

if (s1=="|")
    {s2=substr($0,2,2);
    if (s2=="|")
        {
        $0=substr($0,3);
    }else{
        split($0,d,"/");
        $0=d[3];
    }}
else{
split($0,d,"/");
$0=d[1];
}
star=index($0,"*");
if (star!=0)
{
    $0=substr($0,star+1);
    dot=index($0,".");
    if (dot!=0)
        $0=substr($0,dot+1);
    else
        next;
    s1=substr($0,1,1);
}
if (s1==".")
{fin=substr($0,2);}
else{fin=$0;}
if (index($0,".")==0) next;
match(fin,"^[0-9\.]+")
if (RSTART==1 && RLENGTH==length(fin)) {print "ipset add gfwlist "fin>"/tmp/doipset.sh";next;}
if (fin=="" || finl==fin) next;
finl=fin;
if (white==0)
    {print("server=/"fin"/127.0.0.1#5335\nipset=/"fin"/gfwlist");}
else{
    print("server=/"fin"/#\nipset=/"fin"/whitelist");}
}' /tmp/gfwlist.txt > /tmp/gfwlist.conf