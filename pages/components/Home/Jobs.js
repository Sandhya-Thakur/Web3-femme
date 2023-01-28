import Link from 'next/link';

export default function Jobs() {
  return (
      <>
      <div className='job-image'>
      <h1>jobs</h1>
      <h2>
        <Link href="/">Back to home</Link>
        </h2>
        <h2><Link href="./network">Network</Link></h2>
        <h2><Link href="./messaging">messages</Link></h2>
        </div>
    </>
  );
}