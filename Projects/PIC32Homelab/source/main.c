extern void sysInitialization(void);
extern void sysMainTask(void);

void main(void)
{
  sysInitialization();

  while (1)
  {
		sysMainTask();
		//drvUSBHIDHOSTTask();
	}
}