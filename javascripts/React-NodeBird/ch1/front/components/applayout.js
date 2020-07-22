

import React from "react";
import {Menu,Input} from 'antd';

const AppLayout = () =>{
    return(
        <div>
            <Menu>
                <Menu.Item key="home">Node bird</Menu.Item>
                <Menu.Item key="profile">Node Profile</Menu.Item>
                <Menu.Item key="mail">
                    <Input.Search enterButton/>
                </Menu.Item>
            </Menu>

        </div>

    )

}


export default AppLayout