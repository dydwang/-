let table=[
    ['reply','varchar(200) '],
    ['ids','BIGINT primary key'],
    ['text','varchar(200) not null'],
    ['blogId','BIGINT not null'],
    ['userId','varchar(200) not null'],
]
module.exports=table
