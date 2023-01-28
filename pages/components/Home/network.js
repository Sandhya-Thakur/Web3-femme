import Link from 'next/link';

export default function Network() {
  return (
    <>
    <div className='network-image'>
      <h1>network</h1>
      <h2>
        <Link href="/">Back to home</Link>
        </h2>
        <h2><Link href="./messaging">messages</Link></h2>
        </div>
      
    </>
  );
}