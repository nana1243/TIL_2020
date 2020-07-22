
import React from "react";
import Link  from "next/link";
import AppLayout from "../components/applayout";
import Head from 'next/head';

const Home = () => {
    return (
        <>
            <Head>
                <title> Node bird</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/antd/4.3.5/antd.css"/>

                </Head>
            <AppLayout >
                <Link href={"/about"}><a>about</a></Link>
                <div>hi! next</div>
            </AppLayout>
        </>
            );
};
export default Home;